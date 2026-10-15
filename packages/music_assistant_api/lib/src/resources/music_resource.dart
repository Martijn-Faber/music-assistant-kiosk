import 'command_sender.dart';
import 'playlists_resource.dart';
import 'radios_resource.dart';

class MusicResource {
  MusicResource(MusicAssistantCommandSender sendCommand)
    : radios = RadiosResource(sendCommand),
      playlists = PlaylistsResource(sendCommand);

  final RadiosResource radios;
  final PlaylistsResource playlists;
}
