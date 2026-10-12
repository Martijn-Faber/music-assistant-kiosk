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
    // Afhankelijk van de Music Assistant API payload
    final metadata = json['metadata'] as Map<String, dynamic>?;
    return Playlist(
      uri: json['uri'] as String? ?? json['item_id'] as String? ?? '',
      name: json['name'] as String? ?? 'Afspeellijst',
      owner: json['owner'] as String? ?? metadata?['owner'] as String?,
      imageUrl: json['image_url'] as String? ?? metadata?['image_url'] as String?,
    );
  }
}