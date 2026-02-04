import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../models/documentacion.dart';

//-----------------------------------
// DOCUMENTACIÓN PROVIDER
/// --------------------------------------


// ESTADO
//contiene los documentos del inmueble

class DocumentacionProvider extends ChangeNotifier {
  final Map<String, File?> _documentos = {
    'escritura': null,
    'certificado': null,
    'cedula': null,
    'fotografias': null,
  };


 /// GETTERS
 
  File? getDocumento(String key) => _documentos[key];

  bool get tieneAlgunoSubido =>
      _documentos.values.any((file) => file != null);


 // -------------------------------------------------------------------------
  /// SELECCIÓN DE DOCUMENTOS
  // --------------------------------------------

  Future<void> seleccionarDocumento(String key) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );

    if (result == null || result.files.single.path == null) return;

    _documentos[key] = File(result.files.single.path!);
    notifyListeners();
  }

 // CONSTRUCCIÓN DEL MODELO

  Documentacion buildModel() {
    return Documentacion(
      documentos: _documentos.values
          .whereType<File>()
          .map((f) => f.path)   //Solo se guarda el path del archivo no se sube el archivo
          .toList(),            // Por lo que esta implementacion queda asi
    );
  }

 // LIMPIEZA DEL ESTADO
 
  void limpiar() {
    for (final key in _documentos.keys) {
      _documentos[key] = null;
    }
    notifyListeners();
  }
}
