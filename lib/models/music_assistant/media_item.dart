/// Fields from Music Assistant library media entities used by the kiosk.
class MusicAssistantMediaItem {
  const MusicAssistantMediaItem({
    required this.itemId,
    required this.mediaType,
    this.uri,
    this.name,
    this.favorite = false,
    this.imageUrl,
    this.raw = const {},
  });

  final String itemId;
  final String mediaType;
  final String? uri;
  final String? name;
  final bool favorite;
  final String? imageUrl;

  /// Retains unmodeled metadata so callers can read API additions safely.
  final Map<String, dynamic> raw;

  factory MusicAssistantMediaItem.fromJson(Map<String, dynamic> json) {
    final nested = json['media_item'] ?? json['item'];
    final media = nested is Map ? Map<String, dynamic>.from(nested) : json;
    final itemId = _firstString([media['item_id'], json['item_id'], media['uri'], json['uri']]);
    final mediaType = _firstString([media['media_type'], json['media_type']]);
    if (itemId == null || mediaType == null) {
      throw const FormatException('The media item is missing its id or type.');
    }
    final name = _firstString([media['name'], media['title'], json['name']]);
    final image = _firstString([
      media['image_url'], media['image'], json['image_url'], json['image'],
    ]);
    return MusicAssistantMediaItem(
      itemId: itemId,
      mediaType: mediaType,
      uri: _firstString([media['uri'], json['uri']]),
      name: name,
      favorite: media['favorite'] == true || json['favorite'] == true,
      imageUrl: image,
      raw: Map<String, dynamic>.unmodifiable(media),
    );
  }

  static String? _firstString(List<Object?> values) {
    for (final value in values) {
      if (value is String && value.trim().isNotEmpty) return value;
    }
    return null;
  }
}
