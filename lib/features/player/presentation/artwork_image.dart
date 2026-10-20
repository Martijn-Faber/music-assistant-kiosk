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
    this.useLowResolutionPlaceholder = false,
    this.safeInVirtualizedList = false,
  });

  final String? imageUrl;
  final String serverUrl;
  final String token;
  final double size;
  final bool showShadow;
  final bool gaplessPlayback;
  final bool useLowResolutionPlaceholder;
  final bool safeInVirtualizedList;

  @override
  Widget build(BuildContext context) {
    final sourceProvider = artworkImageProvider(
      imageUrl: imageUrl,
      serverUrl: serverUrl,
      token: token,
    );
    final pixelRatio = MediaQuery.devicePixelRatioOf(context);
    final decodeWidth = (size * pixelRatio).round().clamp(1, 512).toInt();
    final imageProvider = sourceProvider == null
        ? null
        : ResizeImage(sourceProvider, width: decodeWidth);
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
    required this.size,
    required this.placeholderBuilder,
  });

  final ImageProvider imageProvider;
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _resolveImage();
  }

  @override
  void didUpdateWidget(covariant _NetworkArtworkFrame oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageProvider != widget.imageProvider ||
        oldWidget.size != widget.size) {
      _resolveImage();
    }
  }

  void _resolveImage() {
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

  @override
  void dispose() {
    final stream = _imageStream;
    final listener = _imageListener;
    if (stream != null && listener != null) {
      stream.removeListener(listener);
    }
    _imageInfo?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageInfo = _imageInfo;
    if (_failed) return widget.placeholderBuilder(false);
    if (imageInfo == null) return widget.placeholderBuilder(true);
    return RawImage(
      image: imageInfo.image,
      scale: imageInfo.scale,
      fit: BoxFit.cover,
      width: widget.size,
      height: widget.size,
      filterQuality: FilterQuality.medium,
    );
  }
}

NetworkImage? artworkImageProvider({
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
  
  return NetworkImage(
    uri.toString(),
    headers: useAuthorization ? {'Authorization': 'Bearer $token'} : null,
  );
}

ImageProvider? artworkLowResolutionImageProvider({
  required String? imageUrl,
  required String serverUrl,
  required String token,
}) {
  final uri = _resolveArtworkUri(imageUrl, serverUrl);
  if (uri == null) return null;

  if (uri.path.contains('imageproxy')) {
    // Ask the image proxy for a small JPEG so the placeholder uses less
    // bandwidth than the full-resolution artwork request.
    return artworkImageProvider(
      imageUrl: imageUrl,
      serverUrl: serverUrl,
      token: token,
      imageProxySize: 32,
      imageProxyFormat: 'jpg',
    );
  }

  // Non-proxy artwork has no server-side resize option, so decode it smaller
  // on the client as a fallback.
  final sourceProvider = artworkImageProvider(
    imageUrl: imageUrl,
    serverUrl: serverUrl,
    token: token,
  );
  return sourceProvider == null
      ? null
      : ResizeImage(sourceProvider, width: 32, height: 32);
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
