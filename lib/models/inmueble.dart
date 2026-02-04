import 'informacion_inmueble.dart';
import 'autorizacion.dart';
import 'condiciones.dart';
import 'sostenibilidad.dart';
import 'finalidad_social.dart';
import 'documentacion.dart';


class Inmueble {
  final String? id;
  final String propietarioId;

  final InformacionInmueble informacion;
  final Sostenibilidad sostenibilidad;
  final FinalidadSocial finalidadSocial;
  final Condiciones condiciones;
  final Documentacion documentacion;
  final AutorizacionConsentimiento autorizacion;

  Inmueble({
    this.id,
    required this.propietarioId,
    required this.informacion,
    required this.sostenibilidad,
    required this.finalidadSocial,
    required this.condiciones,
    required this.documentacion,
    required this.autorizacion,
  });

  Map<String, dynamic> toMap() {
    return {
      'propietarioId': propietarioId,
      'informacion': informacion.toMap(),
      'sostenibilidad': sostenibilidad.toMap(),
      'finalidadSocial': finalidadSocial.toMap(),
      'condiciones': condiciones.toMap(),
      'documentacion': documentacion.toMap(),
      'autorizacion': autorizacion.toMap(),
      'createdAt': DateTime.now(),
    };
  }

  factory Inmueble.fromMap(String id, Map<String, dynamic> map) {
    return Inmueble(
      id: id,
      propietarioId: map['propietarioId'],
      informacion:
          InformacionInmueble.fromMap(map['informacion']),
      sostenibilidad:
          Sostenibilidad.fromMap(map['sostenibilidad']),
      finalidadSocial:
          FinalidadSocial.fromMap(map['finalidadSocial']),
      condiciones:
          Condiciones.fromMap(map['condiciones']),
      documentacion:
          Documentacion.fromMap(map['documentacion']),
      autorizacion:
          AutorizacionConsentimiento.fromMap(map['autorizacion']),
    );
  }
}
