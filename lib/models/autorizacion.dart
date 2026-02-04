class AutorizacionConsentimiento {
  final bool autorizaDatosPersonales;
  final bool autorizaPublicacion;
  final bool declaraVeracidad;

  AutorizacionConsentimiento({
    required this.autorizaDatosPersonales,
    required this.autorizaPublicacion,
    required this.declaraVeracidad,
  });

  /// Firebase -> Map
  Map<String, dynamic> toMap() {
    return {
      'autorizaDatosPersonales': autorizaDatosPersonales,
      'autorizaPublicacion': autorizaPublicacion,
      'declaraVeracidad': declaraVeracidad,
    };
  }

  factory AutorizacionConsentimiento.fromMap(
    Map<String, dynamic> map) {
  return AutorizacionConsentimiento(
    autorizaDatosPersonales:
        map['autorizaDatosPersonales'] ?? false,
    autorizaPublicacion:
        map['autorizaPublicacion'] ?? false,
    declaraVeracidad:
        map['declaraVeracidad'] ?? false,
  );
}}
