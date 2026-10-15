/// ImageType
///
/// ```json
/// {
///     "type": "string",
///     "enum": [
///         "thumb",
///         "landscape",
///         "fanart",
///         "logo",
///         "clearart",
///         "banner",
///         "cutout",
///         "back",
///         "discart",
///         "other"
///     ],
///     "description": "Enum: ImageType. Possible values: thumb, landscape, fanart, logo, clearart, banner, cutout, back, discart, other"
/// }
/// ```
library;

import 'exports.dart';
part 'music_assistant_image_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MusicAssistantImageType {
  @JsonValue('thumb')
  thumb,
  @JsonValue('landscape')
  landscape,
  @JsonValue('fanart')
  fanart,
  @JsonValue('logo')
  logo,
  @JsonValue('clearart')
  clearart,
  @JsonValue('banner')
  banner,
  @JsonValue('cutout')
  cutout,
  @JsonValue('back')
  back,
  @JsonValue('discart')
  discart,
  @JsonValue('other')
  other,
  @JsonValue('unknown')
  unknown;

  factory MusicAssistantImageType.fromJson(String json) =>
      MusicAssistantImageType.values.firstWhere(
        (e) => e.toJson() == json,
        orElse: () => MusicAssistantImageType.unknown,
      );

  String toJson() => _$MusicAssistantImageTypeEnumMap[this]!;
}
