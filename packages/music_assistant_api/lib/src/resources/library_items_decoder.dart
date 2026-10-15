import '../generated/models/music_assistant_media_collection.dart';
import '../library_item.dart';

List<MusicAssistantLibraryEntry<T>> decodeMusicAssistantLibraryItems<
  T extends Object
>(Object? response, T Function(Map<String, dynamic>) decodeItem) {
  if (response is! List) {
    throw const FormatException('The server returned invalid library items.');
  }
  return [
    for (final value in response)
      if (value is Map)
        if (value['items'] is List &&
            value['item_id'] is String &&
            value['provider_mappings'] is List)
          _decodeCollection(value, decodeItem)
        else
          MusicAssistantLibraryItem(
            decodeItem(Map<String, dynamic>.from(value)),
          )
      else
        throw const FormatException('The server returned an invalid item.'),
  ];
}

MusicAssistantLibraryCollection<T> _decodeCollection<T extends Object>(
  Map value,
  T Function(Map<String, dynamic>) decodeItem,
) {
  final collection = MusicAssistantMediaCollection.fromJson(
    Map<String, dynamic>.from(value),
  );
  return MusicAssistantLibraryCollection(
    collection: collection,
    items: [
      for (final item in collection.items ?? const [])
        decodeItem(Map<String, dynamic>.from(item)),
    ],
  );
}
