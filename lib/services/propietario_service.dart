import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/propietario.dart';


/// -------------------------------
// PROPIETARIO SERVICE
/// -------------------------------

class PropietarioService {

  // REFERENCIA A FIRESTORE

  final _db = FirebaseFirestore.instance;


// CREAR PROPIETARIO

  Future<Propietario> createPropietario(Propietario p) async {
    final doc = await _db.collection('propietarios').add(p.toMap());
    return p.copyWith(id: doc.id);
  }

// OBTENER PROPIETARIOS

  Future<List<Propietario>> getPropietarios() async {
    final snap = await _db.collection('propietarios').get();
    return snap.docs
        .map((d) => Propietario.fromMap(d.data(), d.id))
        .toList();
  }
}
