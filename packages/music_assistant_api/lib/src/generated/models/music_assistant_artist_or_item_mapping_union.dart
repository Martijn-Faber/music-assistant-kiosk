/// MusicAssistantArtistOrItemMappingUnion
///
/// ```json
/// {
///     "oneOf": [
///         {
///             "$ref": "#/components/schemas/Artist"
///         },
///         {
///             "$ref": "#/components/schemas/ItemMapping"
///         }
///     ],
///     "runtimeType": "oneOf"
/// }
/// ```
library;

import 'exports.dart';

sealed class MusicAssistantArtistOrItemMappingUnion {
  const MusicAssistantArtistOrItemMappingUnion();

  const factory MusicAssistantArtistOrItemMappingUnion.artist(
    MusicAssistantArtist value,
  ) = MusicAssistantArtistOrItemMappingUnionArtist;
  const factory MusicAssistantArtistOrItemMappingUnion.itemMapping(
    MusicAssistantItemMapping value,
  ) = MusicAssistantArtistOrItemMappingUnionItemMapping;
  const factory MusicAssistantArtistOrItemMappingUnion.fallback(
    Map<String, dynamic> value,
  ) = MusicAssistantArtistOrItemMappingUnionFallback;

  factory MusicAssistantArtistOrItemMappingUnion.fromJson(
    Map<String, dynamic> json,
  ) {
    // No discriminator in the spec: the variant whose required keys are all
    // present and that declares the most of the payload's keys wins (the
    // earlier one on a tie).
    const variants = <({Set<String> required, Set<String> declared})>[
      (
        required: {'item_id', 'provider', 'name', 'provider_mappings'},
        declared: {
          'item_id',
          'provider',
          'name',
          'version',
          'sort_name',
          'uri',
          'external_ids',
          'is_playable',
          'media_type',
          'provider_mappings',
          'metadata',
          'favorite',
          'position',
          'date_added',
          'artist_type',
        },
      ),
      (
        required: {'item_id', 'provider', 'name'},
        declared: {
          'item_id',
          'provider',
          'name',
          'version',
          'sort_name',
          'uri',
          'external_ids',
          'is_playable',
          'media_type',
          'translation_key',
          'available',
          'image',
          'year',
        },
      ),
    ];
    var best = -1;
    var bestScore = -1;
    for (var i = 0; i < variants.length; i++) {
      final variant = variants[i];
      if (!variant.required.every(json.containsKey)) continue;
      final score = json.keys.where(variant.declared.contains).length;
      if (score > bestScore) {
        best = i;
        bestScore = score;
      }
    }
    return switch (best) {
      0 => MusicAssistantArtistOrItemMappingUnionArtist(
        MusicAssistantArtist.fromJson(json),
      ),
      1 => MusicAssistantArtistOrItemMappingUnionItemMapping(
        MusicAssistantItemMapping.fromJson(json),
      ),
      _ => MusicAssistantArtistOrItemMappingUnionFallback(json),
    };
  }

  Map<String, dynamic> toJson();
}

final class MusicAssistantArtistOrItemMappingUnionArtist
    extends MusicAssistantArtistOrItemMappingUnion {
  const MusicAssistantArtistOrItemMappingUnionArtist(this.value);

  final MusicAssistantArtist value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      other is MusicAssistantArtistOrItemMappingUnionArtist &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'MusicAssistantArtistOrItemMappingUnion.artist($value)';
}

final class MusicAssistantArtistOrItemMappingUnionItemMapping
    extends MusicAssistantArtistOrItemMappingUnion {
  const MusicAssistantArtistOrItemMappingUnionItemMapping(this.value);

  final MusicAssistantItemMapping value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  bool operator ==(Object other) =>
      other is MusicAssistantArtistOrItemMappingUnionItemMapping &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() =>
      'MusicAssistantArtistOrItemMappingUnion.itemMapping($value)';
}

final class MusicAssistantArtistOrItemMappingUnionFallback
    extends MusicAssistantArtistOrItemMappingUnion {
  const MusicAssistantArtistOrItemMappingUnionFallback(this.value);

  final Map<String, dynamic> value;

  @override
  Map<String, dynamic> toJson() => value;

  @override
  String toString() =>
      'MusicAssistantArtistOrItemMappingUnion.fallback($value)';
}
