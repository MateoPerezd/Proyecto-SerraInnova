class InformacionInmueble {
  final String tipoInmueble;
  final String tipoOferta;
  final String direccion;
  final String ciudad;
  final String codigoPostal;
  final int? anioConstruccion;
  final double superficie;
  final int habitaciones;
  final int banos;
  final String estado;
  final String? descripcion;

  InformacionInmueble({
    required this.tipoInmueble,
    required this.tipoOferta,
    required this.direccion,
    required this.ciudad,
    required this.codigoPostal,
    this.anioConstruccion,
    required this.superficie,
    required this.habitaciones,
    required this.banos,
    required this.estado,
    this.descripcion,
  });

  Map<String, dynamic> toMap() => {
        'tipoInmueble': tipoInmueble,
        'tipoOferta': tipoOferta,
        'direccion': direccion,
        'ciudad': ciudad,
        'codigoPostal': codigoPostal,
        'anioConstruccion': anioConstruccion,
        'superficie': superficie,
        'habitaciones': habitaciones,
        'banos': banos,
        'estado': estado,
        'descripcion': descripcion,
      };

  factory InformacionInmueble.fromMap(Map<String, dynamic> map) {
    return InformacionInmueble(
      tipoInmueble: map['tipoInmueble'],
      tipoOferta: map['tipoOferta'],
      direccion: map['direccion'],
      ciudad: map['ciudad'],
      codigoPostal: map['codigoPostal'],
      anioConstruccion: map['anioConstruccion'],
      superficie: (map['superficie'] as num).toDouble(),
      habitaciones: map['habitaciones'],
      banos: map['banos'],
      estado: map['estado'],
      descripcion: map['descripcion'],
    );
  }
}
