class FinalidadSocial {
  final bool adaptadoMovilidadReducida;
  final bool aceptaColectivosVulnerables;
  final bool permiteMascotas;

  FinalidadSocial({
    this.adaptadoMovilidadReducida = false,
    this.aceptaColectivosVulnerables = false,
    this.permiteMascotas = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'adaptadoMovilidadReducida': adaptadoMovilidadReducida,
      'aceptaColectivosVulnerables': aceptaColectivosVulnerables,
      'permiteMascotas': permiteMascotas,
    };
  }

  factory FinalidadSocial.fromMap(Map<String, dynamic> map) {
    return FinalidadSocial(
      adaptadoMovilidadReducida:
          map['adaptadoMovilidadReducida'] ?? false,
      aceptaColectivosVulnerables:
          map['aceptaColectivosVulnerables'] ?? false,
      permiteMascotas: map['permiteMascotas'] ?? false,
    );
  }
}
