import 'dart:collection';
import 'dart:convert';
import 'dart:io';

const _modelRoots = [
  'ServerInfoMessage',
  'Player',
  'PlayerMedia',
  'PlayerQueue',
  'QueueItem',
  'Track',
  'Radio',
  'Playlist',
  'MediaCollection',
  'MediaItemMetadata',
  'MediaItemImage',
  'MediaItemPalette',
  'StreamDetails',
  'AudioFormat',
  'PlaybackState',
  'MediaType',
  'StreamType',
  'ContentType',
  'User',
];

void main() {
  final fullSpecFile = File('api/music_assistant.openapi.json');
  final scopedSpecFile = File('api/music_assistant_models.openapi.json');
  final fullSpec =
      jsonDecode(fullSpecFile.readAsStringSync()) as Map<String, dynamic>;
  final components = fullSpec['components'] as Map<String, dynamic>;
  final fullSchemas = components['schemas'] as Map<String, dynamic>;
  final selectedSchemas = LinkedHashMap<String, dynamic>();

  void includeSchema(String name) {
    if (selectedSchemas.containsKey(name)) return;
    final schema = fullSchemas[name];
    if (schema is! Map<String, dynamic>) {
      throw FormatException('OpenAPI schema "$name" was not found.');
    }
    selectedSchemas[name] = schema;

    final serializedSchema = jsonEncode(schema);
    for (final match in RegExp(
      r'#/components/schemas/([^"}]+)',
    ).allMatches(serializedSchema)) {
      includeSchema(match.group(1)!);
    }
  }

  for (final root in _modelRoots) {
    includeSchema(root);
  }

  // User preferences contain arbitrary JSON values, not object-only values.
  final user = selectedSchemas['User'] as Map<String, dynamic>;
  final userProperties = user['properties'] as Map<String, dynamic>;
  final preferences = userProperties['preferences'] as Map<String, dynamic>;
  preferences['additionalProperties'] = <String, dynamic>{};

  // Naming this inline oneOf keeps the generated union filename within the
  // Windows path limit without changing its JSON representation.
  final audioDsp = selectedSchemas['AudioDSPDetails'] as Map<String, dynamic>;
  final properties = audioDsp['properties'] as Map<String, dynamic>;
  final filters = properties['filters'] as Map<String, dynamic>;
  final items = filters['items'] as Map<String, dynamic>;
  final variants = items['oneOf'];
  if (variants is List) {
    selectedSchemas['AudioDSPFilter'] = {'oneOf': variants};
    filters['items'] = {r'$ref': '#/components/schemas/AudioDSPFilter'};
  }

  final info = fullSpec['info'] as Map<String, dynamic>;
  final scopedSpec = <String, dynamic>{
    'openapi': fullSpec['openapi'],
    'info': {
      'title': 'Music Assistant App Models',
      'version': info['version'],
      'description':
          'Scoped schemas used by the kiosk app, derived from the server OpenAPI spec.',
    },
    'paths': <String, dynamic>{},
    'components': {'schemas': selectedSchemas},
  };
  scopedSpecFile.writeAsStringSync(jsonEncode(scopedSpec));
  stdout.writeln(
    'Refreshed ${selectedSchemas.length} schemas from ${info['version']}.',
  );
}
