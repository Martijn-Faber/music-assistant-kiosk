class RadioStation {
  const RadioStation({
    required this.id,
    required this.name,
    required this.media,
    this.imageUrl,
    this.imageProxyId,
    this.isFavorite = false,
  });

  final String id;
  final String name;
  final Map<String, dynamic> media;
  final String? imageUrl;
  final String? imageProxyId;
  final bool isFavorite;

  String? get provider {
    final mappings = media['provider_mappings'];
    if (mappings is! List) return null;
    for (final mapping in mappings) {
      if (mapping is! Map) continue;
      final value = _firstString([
        mapping['provider_domain'],
        mapping['provider_instance'],
      ]);
      if (value != null) {
        // Instances often append a generated identifier (for example
        // `tunein--abc123`); the domain is the useful, readable provider.
        return value.split('--').first;
      }
    }
    return null;
  }

  factory RadioStation.fromMap(Map<String, dynamic> data) {
    final nestedMedia = data['media_item'];
    final media = nestedMedia is Map
        ? Map<String, dynamic>.from(nestedMedia)
        : Map<String, dynamic>.from(data);
    media.putIfAbsent('media_type', () => 'radio');

    final id = _firstString([
      media['uri'],
      media['item_id'],
      data['uri'],
      data['item_id'],
    ]);
    if (id == null) {
      throw const FormatException('A radio station is missing its URI.');
    }

    return RadioStation(
      id: id,
      name:
          _firstString([
            media['name'],
            media['title'],
            data['name'],
            data['title'],
          ]) ??
          id,
      media: media,
      imageUrl: _imageUrl(media, data),
      imageProxyId: _imageProxyId(media, data),
      isFavorite: media['favorite'] == true || data['favorite'] == true,
    );
  }

  static String? _imageUrl(
    Map<String, dynamic> media,
    Map<String, dynamic> data,
  ) {
    final metadata = media['metadata'] ?? data['metadata'];
    final metadataMap = metadata is Map
        ? Map<String, dynamic>.from(metadata)
        : const <String, dynamic>{};
    final candidates = [
      media['image_url'],
      data['image_url'],
      metadataMap['image_url'],
      media['image'],
      data['image'],
      metadataMap['images'],
    ];
    for (final candidate in candidates) {
      if (candidate is String && candidate.trim().isNotEmpty) {
        return candidate;
      }
      if (candidate is List) {
        for (final image in candidate) {
          if (image is Map) {
            final url = _firstString([
              image['url'],
              image['path'],
              image['image_url'],
            ]);
            if (url != null) return url;
          } else if (image is String && image.trim().isNotEmpty) {
            return image;
          }
        }
      }
      if (candidate is Map) {
        final url = _firstString([
          candidate['url'],
          candidate['path'],
          candidate['image_url'],
        ]);
        if (url != null) return url;
      }
    }
    return null;
  }

  static String? _imageProxyId(
    Map<String, dynamic> media,
    Map<String, dynamic> data,
  ) {
    final metadata = media['metadata'] ?? data['metadata'];
    if (metadata is! Map || metadata['images'] is! List) return null;
    for (final image in metadata['images'] as List) {
      if (image is Map && image['proxy_id'] is String) {
        return image['proxy_id'] as String;
      }
    }
    return null;
  }

  static String? _firstString(List<dynamic> values) {
    for (final value in values) {
      if (value is String && value.isNotEmpty) return value;
    }
    return null;
  }
}
