/// MediaItemPalette
///
/// ```json
/// {
///     "properties": {
///         "primary": {
///             "type": "array",
///             "items": {
///                 "type": "integer"
///             },
///             "nullable": true
///         },
///         "background_light": {
///             "type": "array",
///             "items": {
///                 "type": "integer"
///             },
///             "nullable": true
///         },
///         "on_light": {
///             "type": "array",
///             "items": {
///                 "type": "integer"
///             },
///             "nullable": true
///         },
///         "background_dark": {
///             "type": "array",
///             "items": {
///                 "type": "integer"
///             },
///             "nullable": true
///         },
///         "on_dark": {
///             "type": "array",
///             "items": {
///                 "type": "integer"
///             },
///             "nullable": true
///         },
///         "accent": {
///             "type": "array",
///             "items": {
///                 "type": "integer"
///             },
///             "nullable": true
///         }
///     },
///     "type": "object"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_media_item_palette.freezed.dart';
part 'music_assistant_media_item_palette.g.dart';

@freezed
abstract class MusicAssistantMediaItemPalette
    with _$MusicAssistantMediaItemPalette {
  const MusicAssistantMediaItemPalette._();

  @jsonSerializable
  const factory MusicAssistantMediaItemPalette({
    /// primary
    @JsonKey(name: MusicAssistantMediaItemPalette.primaryKey_)
    List<int>? primary,

    /// backgroundLight
    @JsonKey(name: MusicAssistantMediaItemPalette.backgroundLightKey_)
    List<int>? backgroundLight,

    /// onLight
    @JsonKey(name: MusicAssistantMediaItemPalette.onLightKey_)
    List<int>? onLight,

    /// backgroundDark
    @JsonKey(name: MusicAssistantMediaItemPalette.backgroundDarkKey_)
    List<int>? backgroundDark,

    /// onDark
    @JsonKey(name: MusicAssistantMediaItemPalette.onDarkKey_) List<int>? onDark,

    /// accent
    @JsonKey(name: MusicAssistantMediaItemPalette.accentKey_) List<int>? accent,
  }) = _MusicAssistantMediaItemPalette;

  factory MusicAssistantMediaItemPalette.fromJson(Map<String, dynamic> json) =>
      _$MusicAssistantMediaItemPaletteFromJson(json);

  static const String primaryKey_ = 'primary';

  static const String backgroundLightKey_ = 'background_light';

  static const String onLightKey_ = 'on_light';

  static const String backgroundDarkKey_ = 'background_dark';

  static const String onDarkKey_ = 'on_dark';

  static const String accentKey_ = 'accent';
}
