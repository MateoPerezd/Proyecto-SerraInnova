class Condiciones {
  final double? precioVenta;
  final double? precioAlquiler;
  final double? fianza;
  final String? observaciones;
  final DateTime? fechaDisponibilidad;

  Condiciones({
    this.precioVenta,
    this.precioAlquiler,
    this.fianza,
    this.observaciones,
    this.fechaDisponibilidad
  });

  Map<String, dynamic> toMap() {
    return {
      'precioVenta': precioVenta,
      'precioAlquiler': precioAlquiler,
      'fianza': fianza,
      'observaciones': observaciones,
       'fechaDisponibilidad': fechaDisponibilidad?.toIso8601String(),


    };
  }

  factory Condiciones.fromMap(Map<String, dynamic> map) {
    return Condiciones(
      precioVenta: map['precioVenta']?.toDouble(),
      precioAlquiler: map['precioAlquiler']?.toDouble(),
      fianza: map['fianza']?.toDouble(),
      observaciones: map['observaciones'],
      fechaDisponibilidad: map['fechaDisponibilidad'] != null
          ? DateTime.parse(map['fechaDisponibilidad'])
          : null,
    );
  }
}
