import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// ===============
// CARGA DE DOCUMENTOS
//=================

class CustomDocumentItem extends StatelessWidget {
  final String label;  // Ej: "Escritura", "Certificado energético"
  final File? file;    
  // Archivo actualmente seleccionado
  final void Function(File file) onSelected;

  const CustomDocumentItem({
    super.key,
    required this.label,
    required this.file,
    required this.onSelected,
  });

// SELECTOR DE ARCHIVOS

  Future<void> _pickFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );

    if (result != null && result.files.single.path != null) {
      onSelected(File(result.files.single.path!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final uploaded = file != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: uploaded ? Colors.green : Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          //Icono de estado 
          Icon(
            uploaded ? Icons.check_circle : Icons.upload_file,
            color: uploaded ? Colors.green : Colors.grey,
          ),
          const SizedBox(width: 12),
          Expanded(
            // TEXTO DEL DOCUMENTO
            child: Text(
              uploaded ? '$label (adjunto)' : label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2A7A),
              ),
            ),
          ),
          // ACCIÓN  (La idea sería que se suba un archivo o se reemplace uno ya subido)
          TextButton(
            onPressed: () => _pickFile(context),
            child: Text(uploaded ? 'Reemplazar' : 'Subir archivo'),
          ),
        ],
      ),
    );
  }
}
