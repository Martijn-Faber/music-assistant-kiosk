/// An authentication provider configured on a Music Assistant server.
class MusicAssistantAuthProvider {
  const MusicAssistantAuthProvider({
    required this.providerId,
    required this.providerType,
    required this.requiresRedirect,
  });

  final String providerId;
  final String providerType;
  final bool requiresRedirect;

  factory MusicAssistantAuthProvider.fromJson(Map<String, dynamic> json) =>
      MusicAssistantAuthProvider(
        providerId: json['provider_id'] as String,
        providerType: json['provider_type'] as String,
        requiresRedirect: json['requires_redirect'] as bool,
      );
}
