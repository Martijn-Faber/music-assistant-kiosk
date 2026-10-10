class RadioStation {
  const RadioStation({
    required this.id,
    required this.name,
    required this.media,
    this.imageUrl,
  });

  final String id;
  final String name;
  final Map<String, dynamic> media;
  final String? imageUrl;

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

  static String? _firstString(List<dynamic> values) {
    for (final value in values) {
      if (value is String && value.isNotEmpty) return value;
    }
    return null;
  }
}
