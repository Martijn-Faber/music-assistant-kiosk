import '../generated/models/music_assistant_radio.dart';
import '../library_item.dart';
import 'command_sender.dart';
import 'library_items_decoder.dart';

class RadiosResource {
  const RadiosResource(this._sendCommand);

  final MusicAssistantCommandSender _sendCommand;

  /// Fetches radio library items, preserving collection entries in the result.
  ///
  /// Each array element is a typed radio item or typed media collection.
  Future<List<MusicAssistantLibraryEntry<MusicAssistantRadio>>>
  libraryItems() async {
    final response = await _sendCommand('music/radios/library_items');
    return decodeMusicAssistantLibraryItems(
      response,
      MusicAssistantRadio.fromJson,
    );
  }
}
