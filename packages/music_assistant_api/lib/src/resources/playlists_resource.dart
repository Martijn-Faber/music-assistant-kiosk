import '../generated/models/music_assistant_playlist.dart';
import '../library_item.dart';
import 'command_sender.dart';
import 'library_items_decoder.dart';

class PlaylistsResource {
  const PlaylistsResource(this._sendCommand);

  final MusicAssistantCommandSender _sendCommand;

  /// Fetches playlist library items, preserving collection entries in the result.
  ///
  /// Each array element is a typed playlist item or typed media collection.
  Future<List<MusicAssistantLibraryEntry<MusicAssistantPlaylist>>>
  libraryItems({bool favorite = true}) async {
    final response = await _sendCommand(
      'music/playlists/library_items',
      args: {'favorite': favorite},
    );
    return decodeMusicAssistantLibraryItems(
      response,
      MusicAssistantPlaylist.fromJson,
    );
  }
}
