import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../design_system/glass_tokens.dart';

class ArtworkImage extends StatelessWidget {
  const ArtworkImage({
    super.key,
    required this.imageUrl,
    required this.serverUrl,
    required this.token,
    this.size = 164,
    this.showShadow = true,
    this.gaplessPlayback = true,
    this.imageSize = 0,
    this.useLowResolutionPlaceholder = false,
    this.safeInVirtualizedList = false,
  }) : assert(
         imageSize == 0 ||
             imageSize == 80 ||
             imageSize == 160 ||
             imageSize == 256 ||
             imageSize == 512 ||
             imageSize == 1024,
       );

  final String? imageUrl;
  final String serverUrl;
  final String token;
  final double size;
  final bool showShadow;
  final bool gaplessPlayback;
  /// Requested proxy rendition: 0 uses original size; other values are fixed
  /// sizes.
  final int imageSize;
  final bool useLowResolutionPlaceholder;
  final bool safeInVirtualizedList;

  @override
  Widget build(BuildContext context) {
    final sourceProvider = artworkImageProvider(
      imageUrl: imageUrl,
      serverUrl: serverUrl,
      token: token,
      imageProxySize: imageSize,
      imageProxyFormat: 'jpg',
    );
    final pixelRatio = MediaQuery.devicePixelRatioOf(context);
    final decodeWidth = (size * pixelRatio).round().clamp(1, 512).toInt();
    final imageProvider = sourceProvider == null
        ? null
        : imageSize == 0
        ? ResizeImage(sourceProvider, width: decodeWidth)
        : sourceProvider;
    final lowResolutionProvider = useLowResolutionPlaceholder
        ? artworkLowResolutionImageProvider(
            imageUrl: imageUrl,
            serverUrl: serverUrl,
            token: token,
          )
        : null;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: showShadow
            ? const [
                BoxShadow(
                  color: Color(0x44000000),
                  blurRadius: 18,
                  offset: Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox.square(
          dimension: size,
          child: imageProvider == null
              ? _placeholder()
              : safeInVirtualizedList
              ? _NetworkArtworkFrame(
                  imageProvider: imageProvider,
                  lowResolutionImageProvider: lowResolutionProvider,
                  size: size,
                  placeholderBuilder: (loading) =>
                      _placeholder(loading: loading),
                )
              : Image(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  gaplessPlayback: gaplessPlayback,
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                    if (lowResolutionProvider == null) return child;
                    final highResolutionReady =
                        wasSynchronouslyLoaded || frame != null;
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        _placeholder(loading: true),
                        _lowResolutionArtwork(lowResolutionProvider),
                        AnimatedOpacity(
                          opacity: highResolutionReady ? 1 : 0,
                          duration: GlassTokens.motionQuick,
                          child: child,
                        ),
                      ],
                    );
                  },
                  loadingBuilder: (context, child, progress) {
                    if (progress == null || lowResolutionProvider != null) {
                      return child;
                    }
                    return Stack(
                      fit: StackFit.expand,
                      children: [_placeholder(loading: true), child],
                    );
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      lowResolutionProvider == null
                      ? _placeholder()
                      : _lowResolutionArtwork(lowResolutionProvider),
                ),
        ),
      ),
    );
  }

  Widget _placeholder({bool loading = false}) {
    return ClipRect(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF242832),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.18),
            width: 1,
          ),
        ),
        child: Center(
          child: loading
              ? SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white.withValues(alpha: 0.78),
                  ),
                )
              : Icon(
                  CupertinoIcons.music_albums,
                  size: GlassTokens.iconSizeXl,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
        ),
      ),
    );
  }

  Widget _lowResolutionArtwork(ImageProvider provider) => ImageFiltered(
    imageFilter: ui.ImageFilter.blur(sigmaX: 4, sigmaY: 4),
    child: Image(
      image: provider,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.low,
      gaplessPlayback: false,
      errorBuilder: (context, error, stackTrace) => _placeholder(),
    ),
  );
}

/// Resolves artwork directly so an in-flight queue image doesn't consult a
/// Scrollable's BuildContext after its row has been removed from the list.
class _NetworkArtworkFrame extends StatefulWidget {
  const _NetworkArtworkFrame({
    required this.imageProvider,
    required this.lowResolutionImageProvider,
    required this.size,
    required this.placeholderBuilder,
  });

  final ImageProvider imageProvider;
  final ImageProvider? lowResolutionImageProvider;
  final double size;
  final Widget Function(bool loading) placeholderBuilder;

  @override
  State<_NetworkArtworkFrame> createState() => _NetworkArtworkFrameState();
}

class _NetworkArtworkFrameState extends State<_NetworkArtworkFrame> {
  ImageStream? _imageStream;
  ImageStreamListener? _imageListener;
  ImageInfo? _imageInfo;
  bool _failed = false;
  ImageStream? _lowResolutionImageStream;
  ImageStreamListener? _lowResolutionImageListener;
  ImageInfo? _lowResolutionImageInfo;
  bool _lowResolutionFailed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _resolveImage();
  }

  @override
  void didUpdateWidget(covariant _NetworkArtworkFrame oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageProvider != widget.imageProvider ||
        oldWidget.lowResolutionImageProvider !=
            widget.lowResolutionImageProvider ||
        oldWidget.size != widget.size) {
      _resolveImage();
    }
  }

  void _resolveImage() {
    _resolveLowResolutionImage();
    final configuration = createLocalImageConfiguration(
      context,
      size: Size(widget.size, widget.size),
    );
    final stream = widget.imageProvider.resolve(configuration);
    if (_imageStream?.key == stream.key) return;

    final previousStream = _imageStream;
    final previousListener = _imageListener;
    if (previousStream != null && previousListener != null) {
      previousStream.removeListener(previousListener);
    }
    _imageInfo?.dispose();
    _imageInfo = null;
    _failed = false;
    _imageStream = stream;

    late final ImageStreamListener listener;
    listener = ImageStreamListener(
      (imageInfo, _) {
        if (!mounted || !identical(_imageStream, stream)) {
          imageInfo.dispose();
          return;
        }
        final previousInfo = _imageInfo;
        setState(() {
          _imageInfo = imageInfo;
          _failed = false;
        });
        previousInfo?.dispose();
      },
      onError: (Object _, StackTrace? __) {
        if (!mounted || !identical(_imageStream, stream)) return;
        setState(() => _failed = true);
      },
    );
    _imageListener = listener;
    stream.addListener(listener);
  }

  void _resolveLowResolutionImage() {
    final provider = widget.lowResolutionImageProvider;
    if (provider == null) {
      final previousStream = _lowResolutionImageStream;
      final previousListener = _lowResolutionImageListener;
      if (previousStream != null && previousListener != null) {
        previousStream.removeListener(previousListener);
      }
      _lowResolutionImageStream = null;
      _lowResolutionImageListener = null;
      _lowResolutionImageInfo?.dispose();
      _lowResolutionImageInfo = null;
      _lowResolutionFailed = false;
      return;
    }
    final configuration = createLocalImageConfiguration(
      context,
      size: Size(widget.size, widget.size),
    );
    final stream = provider.resolve(configuration);
    if (_lowResolutionImageStream?.key == stream.key) return;

    final previousStream = _lowResolutionImageStream;
    final previousListener = _lowResolutionImageListener;
    if (previousStream != null && previousListener != null) {
      previousStream.removeListener(previousListener);
    }
    _lowResolutionImageInfo?.dispose();
    _lowResolutionImageInfo = null;
    _lowResolutionFailed = false;
    _lowResolutionImageStream = stream;

    late final ImageStreamListener listener;
    listener = ImageStreamListener(
      (imageInfo, _) {
        if (!mounted || !identical(_lowResolutionImageStream, stream)) {
          imageInfo.dispose();
          return;
        }
        final previousInfo = _lowResolutionImageInfo;
        setState(() {
          _lowResolutionImageInfo = imageInfo;
          _lowResolutionFailed = false;
        });
        previousInfo?.dispose();
      },
      onError: (Object _, StackTrace? __) {
        if (!mounted || !identical(_lowResolutionImageStream, stream)) return;
        setState(() => _lowResolutionFailed = true);
      },
    );
    _lowResolutionImageListener = listener;
    stream.addListener(listener);
  }

  @override
  void dispose() {
    final stream = _imageStream;
    final listener = _imageListener;
    if (stream != null && listener != null) {
      stream.removeListener(listener);
    }
    final lowResolutionStream = _lowResolutionImageStream;
    final lowResolutionListener = _lowResolutionImageListener;
    if (lowResolutionStream != null && lowResolutionListener != null) {
      lowResolutionStream.removeListener(lowResolutionListener);
    }
    _imageInfo?.dispose();
    _lowResolutionImageInfo?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageInfo = _imageInfo;
    final lowResolutionImageInfo = _lowResolutionImageInfo;
    if (_failed) {
      if (lowResolutionImageInfo != null) {
        return _lowResolutionArtwork(lowResolutionImageInfo);
      }
      return widget.placeholderBuilder(false);
    }
    if (imageInfo == null && lowResolutionImageInfo == null) {
      return widget.placeholderBuilder(!_lowResolutionFailed);
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        if (lowResolutionImageInfo != null)
          _lowResolutionArtwork(lowResolutionImageInfo),
        AnimatedOpacity(
          opacity: imageInfo == null ? 0 : 1,
          duration: GlassTokens.motionQuick,
          child: imageInfo == null
              ? const SizedBox.expand()
              : _rawArtwork(imageInfo),
        ),
      ],
    );
  }

  Widget _lowResolutionArtwork(ImageInfo imageInfo) => ImageFiltered(
    imageFilter: ui.ImageFilter.blur(sigmaX: 4, sigmaY: 4),
    child: _rawArtwork(imageInfo, filterQuality: FilterQuality.low),
  );

  Widget _rawArtwork(
    ImageInfo imageInfo, {
    FilterQuality filterQuality = FilterQuality.medium,
  }) => RawImage(
    image: imageInfo.image,
    scale: imageInfo.scale,
    fit: BoxFit.cover,
    width: widget.size,
    height: widget.size,
    filterQuality: filterQuality,
  );
}

ImageProvider? artworkImageProvider({
  required String? imageUrl,
  required String serverUrl,
  required String token,
  int? imageProxySize,
  String? imageProxyFormat,
}) {
  final uri = _resolveArtworkUri(
    imageUrl,
    serverUrl,
    imageProxySize: imageProxySize,
    imageProxyFormat: imageProxyFormat,
  );
  if (uri == null) return null;

  final serverUri = Uri.tryParse(serverUrl);
  // Send the bearer token when the request targets our configured server.
  final useAuthorization = serverUri != null && uri.host == serverUri.host;
  final networkProvider = NetworkImage(
    uri.toString(),
    headers: useAuthorization ? {'Authorization': 'Bearer $token'} : null,
  );
  if (imageProxySize == null) {
    return networkProvider;
  }

  if (uri.path.contains('imageproxy')) {
    return networkProvider;
  }

  if (imageProxySize == 0) return networkProvider;

  // Non-proxy artwork cannot be resized by the server, so resize it locally.
  return ResizeImage(
    networkProvider,
    width: imageProxySize,
    height: imageProxySize,
  );
}

ImageProvider? artworkLowResolutionImageProvider({
  required String? imageUrl,
  required String serverUrl,
  required String token,
}) {
  // Keep preview quality selection inside this image-loading module.
  return artworkImageProvider(
    imageUrl: imageUrl,
    serverUrl: serverUrl,
    token: token,
    imageProxySize: 80,
    imageProxyFormat: 'jpg',
  );
}

Uri? _resolveArtworkUri(
  String? value,
  String baseUrl, {
  int? imageProxySize,
  String? imageProxyFormat,
}) {
  if (value == null || value.trim().isEmpty) return null;
  final trimmed = value.trim();
  final baseUri = Uri.tryParse(baseUrl);
  if (baseUri == null) return null;

  // Route image-proxy URLs through the configured server, regardless of the
  // host embedded in the original URL, and preserve any existing parameters.
  final parsedValue = Uri.tryParse(trimmed);
  if (parsedValue != null && parsedValue.path.contains('imageproxy')) {
    final queryParameters = Map<String, String>.from(
      parsedValue.queryParameters,
    );
    if (imageProxySize != null) {
      queryParameters['size'] = imageProxySize.toString();
    }
    if (imageProxyFormat != null) {
      queryParameters['fmt'] = imageProxyFormat;
    }
    final resolved = baseUri.replace(
      path: parsedValue.path,
      queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
    );
    return {'http', 'https'}.contains(resolved.scheme) ? resolved : null;
  }

  // Resolve other absolute or relative artwork URLs as usual.
  if (parsedValue != null && parsedValue.hasScheme) {
    return {'http', 'https'}.contains(parsedValue.scheme) ? parsedValue : null;
  }

  final resolved = baseUri.resolve(trimmed);
  return {'http', 'https'}.contains(resolved.scheme) ? resolved : null;
}
