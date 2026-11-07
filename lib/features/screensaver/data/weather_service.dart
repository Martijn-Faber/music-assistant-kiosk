import 'dart:convert';
import 'dart:io';

class WeatherSnapshot {
  const WeatherSnapshot({required this.temperature, required this.code});
  final double temperature;
  final int code;
}

class WeatherService {
  Future<WeatherSnapshot?> fetch(String location) async {
    final client = HttpClient()..connectionTimeout = const Duration(seconds: 8);
    try {
      final search = Uri.https('geocoding-api.open-meteo.com', '/v1/search', {'name': location, 'count': '1', 'language': 'en', 'format': 'json'});
      final place = await _get(client, search);
      final results = place['results'] as List<dynamic>?;
      if (results == null || results.isEmpty) return null;
      final first = results.first as Map<String, dynamic>;
      final uri = Uri.https('api.open-meteo.com', '/v1/forecast', {
        'latitude': '${first['latitude']}', 'longitude': '${first['longitude']}',
        'current': 'temperature_2m,weather_code', 'timezone': 'auto',
      });
      final data = await _get(client, uri);
      final current = data['current'] as Map<String, dynamic>;
      return WeatherSnapshot(
        temperature: (current['temperature_2m'] as num).toDouble(),
        code: (current['weather_code'] as num).toInt(),
      );
    } catch (_) {
      return null;
    } finally {
      client.close(force: true);
    }
  }

  Future<Map<String, dynamic>> _get(HttpClient client, Uri uri) async {
    final request = await client.getUrl(uri);
    final response = await request.close();
    if (response.statusCode != 200) throw HttpException('Weather request failed');
    return jsonDecode(await response.transform(utf8.decoder).join()) as Map<String, dynamic>;
  }
}
