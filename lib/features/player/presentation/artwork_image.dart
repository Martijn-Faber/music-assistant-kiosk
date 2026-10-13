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
  });

  final String? imageUrl;
  final String serverUrl;
  final String token;
  final double size;

  @override
  Widget build(BuildContext context) {
    final imageProvider = artworkImageProvider(
      imageUrl: imageUrl,
      serverUrl: serverUrl,
      token: token,
    );

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x44000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox.square(
          dimension: size,
          child: imageProvider == null
              ? _placeholder()
              : Image(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) =>
                      progress == null ? child : _placeholder(loading: true),
                  errorBuilder: (context, error, stackTrace) => _placeholder(),
                ),
        ),
      ),
    );
  }

  Widget _placeholder({bool loading = false}) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF242832).withValues(alpha: 0.44),
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
      ),
    );
  }
}

// NetworkImage? artworkImageProvider({
//   required String? imageUrl,
//   required String serverUrl,
//   required String token,
// }) {
//   final uri = _resolveArtworkUri(imageUrl, serverUrl);
//   if (uri == null) return null;

//   final serverUri = Uri.tryParse(serverUrl);
//   final useAuthorization = serverUri != null && uri.origin == serverUri.origin;
//   return NetworkImage(
//     uri.toString(),
//     headers: useAuthorization ? {'Authorization': 'Bearer $token'} : null,
//   );
// }

NetworkImage? artworkImageProvider({
  required String? imageUrl,
  required String serverUrl,
  required String token,
}) {
  final uri = _resolveArtworkUri(imageUrl, serverUrl);
  if (uri == null) return null;

  final serverUri = Uri.tryParse(serverUrl);
  // Stuur altijd de bearer token mee als de aanvraag naar onze eigen serverUrl gaat
  final useAuthorization = serverUri != null && uri.host == serverUri.host;
  
  return NetworkImage(
    uri.toString(),
    headers: useAuthorization ? {'Authorization': 'Bearer $token'} : null,
  );
}

// Uri? _resolveArtworkUri(String? value, String baseUrl) {
//   if (value == null || value.trim().isEmpty) return null;
//   final uri = Uri.tryParse(value.trim());
//   if (uri == null) return null;
//   if (uri.hasScheme) {
//     return {'http', 'https'}.contains(uri.scheme) ? uri : null;
//   }

//   final baseUri = Uri.tryParse(baseUrl);
//   if (baseUri == null) return null;
//   final resolved = baseUri.resolveUri(uri);
//   return {'http', 'https'}.contains(resolved.scheme) ? resolved : null;
// }

Uri? _resolveArtworkUri(String? value, String baseUrl) {
  if (value == null || value.trim().isEmpty) return null;
  final trimmed = value.trim();
  final baseUri = Uri.tryParse(baseUrl);
  if (baseUri == null) return null;

  // Als de URL een imageproxy pad bevat (ongeacht welk lokaal IP of domein er voor staat),
  // herschrijven we hem direct naar je actieve baseUrl (Cloudflare Tunnel)!
  final parsedValue = Uri.tryParse(trimmed);
  if (parsedValue != null && parsedValue.path.contains('imageproxy')) {
    final resolved = baseUri.replace(
      path: parsedValue.path,
      queryParameters: parsedValue.queryParameters.isNotEmpty ? parsedValue.queryParameters : null,
    );
    return {'http', 'https'}.contains(resolved.scheme) ? resolved : null;
  }

  // Standaard afhandeling voor overige absolute of relatieve URLs
  if (parsedValue != null && parsedValue.hasScheme) {
    return {'http', 'https'}.contains(parsedValue.scheme) ? parsedValue : null;
  }

  final resolved = baseUri.resolve(trimmed);
  return {'http', 'https'}.contains(resolved.scheme) ? resolved : null;
}
