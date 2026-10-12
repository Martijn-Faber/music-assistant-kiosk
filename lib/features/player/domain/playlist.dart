class Playlist {
  const Playlist({
    required this.uri,
    required this.name,
    this.owner,
    this.imageUrl,
  });

  final String uri;
  final String name;
  final String? owner;
  final String? imageUrl;

  factory Playlist.fromJson(Map<String, dynamic> json) {
    final nested = json['media_item'] ?? json['item'];
    final media = nested is Map ? Map<String, dynamic>.from(nested) : json;
    final metadata = media['metadata'] ?? json['metadata'];
    final metadataMap = metadata is Map
        ? Map<String, dynamic>.from(metadata)
        : const <String, dynamic>{};
    return Playlist(
      uri: _firstString([media['uri'], media['item_id'], json['uri'], json['item_id']]) ?? '',
      name: _firstString([media['name'], media['title'], json['name']]) ?? 'Playlist',
      owner: _firstString([media['owner'], json['owner'], metadataMap['owner']]),
      imageUrl: _firstString([
        media['image_url'],
        media['image'],
        json['image_url'],
        json['image'],
        metadataMap['image_url'],
      ]) ?? _imageFromList(metadataMap['images']),
    );
  }

  static String? _imageFromList(dynamic value) {
    if (value is String && value.trim().isNotEmpty) return value;
    if (value is List) {
      for (final image in value) {
        if (image is String && image.trim().isNotEmpty) return image;
        if (image is Map) {
          for (final key in ['url', 'path', 'image_url']) {
            final url = image[key];
            if (url is String && url.trim().isNotEmpty) return url;
          }
        }
      }
    }
    return null;
  }

  static String? _firstString(List<dynamic> values) {
    for (final value in values) {
      if (value is String && value.trim().isNotEmpty) return value;
    }
    return null;
  }
}
