import 'package:music_assistant_api/music_assistant_api.dart';

class RecentMediaItem {
  const RecentMediaItem({
    required this.uri,
    required this.name,
    required this.mediaType,
    this.artist,
    this.imageUrl,
  });

  final String uri;
  final String name;
  final String mediaType;
  final String? artist;
  final String? imageUrl;

  RecentMediaItem withImageUrl(String? value) => RecentMediaItem(
    uri: uri,
    name: name,
    mediaType: mediaType,
    artist: artist,
    imageUrl: value ?? imageUrl,
  );

  factory RecentMediaItem.fromMap(Map<String, dynamic> data) {
    final nested = data['media_item'] ?? data['item'];
    final media = nested is Map ? Map<String, dynamic>.from(nested) : data;
    final uri = _firstString([media['uri'], media['item_id'], data['uri']]);
    if (uri == null) throw const FormatException('Recent item has no URI.');

    final artists = media['artists'];
    final artist = artists is List && artists.isNotEmpty
        ? _artistName(artists.first)
        : _firstString([media['artist'], data['artist']]);

    return RecentMediaItem(
      uri: uri,
      name: _firstString([media['name'], media['title'], data['name']]) ?? uri,
      mediaType:
          _firstString([media['media_type'], data['media_type']]) ?? 'track',
      artist: artist,
      imageUrl: imageUrlFromMap(data),
    );
  }

  static String? imageUrlFromMap(Map<String, dynamic> data) {
    final nested = data['media_item'] ?? data['item'];
    final media = nested is Map ? Map<String, dynamic>.from(nested) : data;
    final metadata = media['metadata'] ?? data['metadata'];
    final metadataMap = metadata is Map
        ? Map<String, dynamic>.from(metadata)
        : const <String, dynamic>{};
    final album = media['album'] ?? data['album'];
    final albumMap = album is Map
        ? Map<String, dynamic>.from(album)
        : const <String, dynamic>{};

    for (final candidate in [
      media['image'],
      media['image_url'],
      metadataMap['image'],
      metadataMap['image_url'],
      metadataMap['images'],
      albumMap['image'],
      albumMap['image_url'],
      data['image'],
      data['image_url'],
    ]) {
      final url = _imageUrlFromValue(candidate);
      if (url != null) return url;
    }
    return null;
  }

  static String? imageUrlFromQueueItem(
    MusicAssistantQueueItem item, {
    MusicAssistantAlbumOrItemMapping? album,
  }) {
    final mediaItem = item.mediaItem;
    final albumImage = switch (album) {
      MusicAssistantFullAlbum(:final value) =>
        value.metadata?.images?.isNotEmpty == true
            ? _imagePathFromModel(value.metadata!.images!.first)
            : null,
      MusicAssistantMappedAlbum(:final value) =>
        _imagePathFromModel(value.image),
      null => null,
    };
    return _firstString([
      _imagePathFromModel(item.image),
      albumImage,
      ...?mediaItem?.album?.metadata?.images?.map(_imagePathFromModel),
      ...?mediaItem?.metadata?.images?.map(_imagePathFromModel),
    ]);
  }

  static String? _imagePathFromModel(MusicAssistantMediaItemImage? image) {
    final proxyId = image?.proxyId;
    if (proxyId != null && proxyId.isNotEmpty) {
      return '/imageproxy/$proxyId';
    }
    return image?.path;
  }

  static String? _imageUrlFromValue(dynamic value) {
    if (value is String && value.trim().isNotEmpty) return value;
    if (value is Map) {
      final proxyId = _firstString([value['proxy_id'], value['proxyId']]);
      if (proxyId != null) {
        return '/imageproxy/$proxyId';
      }
      return _firstString([value['url'], value['path'], value['image_url']]);
    }
    if (value is List) {
      for (final image in value) {
        final url = _imageUrlFromValue(image);
        if (url != null) return url;
      }
    }
    return null;
  }

  static String? _artistName(dynamic value) {
    if (value is String) return value;
    if (value is MusicAssistantArtistOrItemMappingUnionArtist) {
      return value.value.name;
    }
    if (value is MusicAssistantArtistOrItemMappingUnionItemMapping) {
      return value.value.name;
    }
    if (value is MusicAssistantArtistOrItemMappingUnionFallback) {
      return _firstString([value.value['name']]);
    }
    if (value is Map) {
      final artist = value['name'];
      return artist is String ? artist : null;
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
