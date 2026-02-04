class Sostenibilidad {
  final String? certificadoEnergetico;
  final List<String> energiasRenovables;
  final String? materialesSostenibles;
  final String? consumoEstimado;

  Sostenibilidad({
    this.certificadoEnergetico,
    this.energiasRenovables = const [],
    this.materialesSostenibles,
    this.consumoEstimado,
  });

  Map<String, dynamic> toMap() {
    return {
      'certificadoEnergetico': certificadoEnergetico,
      'energiasRenovables': energiasRenovables,
      'materialesSostenibles': materialesSostenibles,
      'consumoEstimado': consumoEstimado,
    };
  }

 factory Sostenibilidad.fromMap(Map<String, dynamic> map) {
  return Sostenibilidad(
    certificadoEnergetico: map['certificadoEnergetico'],
    energiasRenovables:
        List<String>.from(map['energiasRenovables'] ?? []),
    materialesSostenibles: map['materialesSostenibles'],
    consumoEstimado: map['consumoEstimado'],
  );
}

}
