import 'generated/models/music_assistant_media_collection.dart';

/// One element in a media library response array.
sealed class MusicAssistantLibraryEntry<T extends Object> {
  const MusicAssistantLibraryEntry();
}

/// A standalone item in a media library response.
final class MusicAssistantLibraryItem<T extends Object>
    extends MusicAssistantLibraryEntry<T> {
  const MusicAssistantLibraryItem(this.item);

  final T item;
}

/// A collection element, preserving its DTO and typed child items.
final class MusicAssistantLibraryCollection<T extends Object>
    extends MusicAssistantLibraryEntry<T> {
  const MusicAssistantLibraryCollection({
    required this.collection,
    required this.items,
  });

  final MusicAssistantMediaCollection collection;
  final List<T> items;
}
