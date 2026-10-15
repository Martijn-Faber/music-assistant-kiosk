import 'generated/models/music_assistant_album.dart';
import 'generated/models/music_assistant_item_mapping.dart';

/// A primitive value supported by Music Assistant's EXTRA_ATTRIBUTES_TYPES.
sealed class MusicAssistantExtraAttributeValue {
  const MusicAssistantExtraAttributeValue();

  factory MusicAssistantExtraAttributeValue.fromJson(Object? value) =>
      switch (value) {
        null => const MusicAssistantNullExtraAttribute(),
        bool value => MusicAssistantBoolExtraAttribute(value),
        int value => MusicAssistantIntExtraAttribute(value),
        double value => MusicAssistantDoubleExtraAttribute(value),
        String value => MusicAssistantStringExtraAttribute(value),
        _ => throw FormatException(
          'Unsupported Music Assistant extra attribute value: '
          '${value.runtimeType}',
        ),
      };
}

final class MusicAssistantStringExtraAttribute
    extends MusicAssistantExtraAttributeValue {
  const MusicAssistantStringExtraAttribute(this.value);
  final String value;
}

final class MusicAssistantIntExtraAttribute
    extends MusicAssistantExtraAttributeValue {
  const MusicAssistantIntExtraAttribute(this.value);
  final int value;
}

final class MusicAssistantDoubleExtraAttribute
    extends MusicAssistantExtraAttributeValue {
  const MusicAssistantDoubleExtraAttribute(this.value);
  final double value;
}

final class MusicAssistantBoolExtraAttribute
    extends MusicAssistantExtraAttributeValue {
  const MusicAssistantBoolExtraAttribute(this.value);
  final bool value;
}

final class MusicAssistantNullExtraAttribute
    extends MusicAssistantExtraAttributeValue {
  const MusicAssistantNullExtraAttribute();
}

typedef MusicAssistantExtraAttributes =
    Map<String, MusicAssistantExtraAttributeValue>;

/// Queue tracks can carry either a full album or the compact item mapping
/// used by the server to reduce queue payload size.
sealed class MusicAssistantAlbumOrItemMapping {
  const MusicAssistantAlbumOrItemMapping();

  factory MusicAssistantAlbumOrItemMapping.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json['provider_mappings'] is List) {
      return MusicAssistantFullAlbum(MusicAssistantAlbum.fromJson(json));
    }
    return MusicAssistantMappedAlbum(MusicAssistantItemMapping.fromJson(json));
  }
}

final class MusicAssistantFullAlbum extends MusicAssistantAlbumOrItemMapping {
  const MusicAssistantFullAlbum(this.value);
  final MusicAssistantAlbum value;
}

final class MusicAssistantMappedAlbum extends MusicAssistantAlbumOrItemMapping {
  const MusicAssistantMappedAlbum(this.value);
  final MusicAssistantItemMapping value;
}
