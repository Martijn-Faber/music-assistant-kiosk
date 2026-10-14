class MusicAssistantApiException implements Exception {
  const MusicAssistantApiException(this.message, {this.code, this.details});

  final String message;
  final int? code;
  final Object? details;

  @override
  String toString() => 'MusicAssistantApiException: $message';
}
