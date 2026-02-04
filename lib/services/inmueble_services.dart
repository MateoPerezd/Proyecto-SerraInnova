import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/inmueble.dart';

// ---------------------------------------------------------------------------
/// INMUEBLE SERVICE
/// -------------------------------------------------------------

class InmuebleService {

  // REFERENCIA A COLECCIÓN
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('inmuebles');


// CREAR INMUEBLE

  Future<Inmueble> createInmueble(Inmueble inmueble) async {
    final doc = await _ref.add(inmueble.toMap());

    return Inmueble(
      id: doc.id,
      propietarioId: inmueble.propietarioId,
      informacion: inmueble.informacion,
      sostenibilidad: inmueble.sostenibilidad,
      finalidadSocial: inmueble.finalidadSocial,
      condiciones: inmueble.condiciones,
      documentacion: inmueble.documentacion,
      autorizacion: inmueble.autorizacion,
    );
  }

// OBTENER INMUEBLES POR PROPIETARIO

  Future<List<Inmueble>> getByPropietario(String propietarioId) async {
    final snapshot = await _ref
        .where('propietarioId', isEqualTo: propietarioId)
        .get();

    return snapshot.docs.map((doc) {
      return Inmueble.fromMap(
        doc.id,
        doc.data() as Map<String, dynamic>,
      );
    }).toList();
  }

  Future<List<Inmueble>> getAllInmuebles() async {
  final snapshot = await _ref.get();

  return snapshot.docs.map((doc) {
    return Inmueble.fromMap(
      doc.id,
      doc.data() as Map<String, dynamic>,
    );
  }).toList();
}

}
