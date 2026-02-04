class Documentacion {
  final List<String> documentos; 
  // URLs o paths en Firebase Storage

  Documentacion({
    required this.documentos,
  });

  /// Firebase -> Map
  Map<String, dynamic> toMap() {
    return {
      'documentos': documentos,
    };
  }

  /// Map -> Firebase
  factory Documentacion.fromMap(Map<String, dynamic> map) {
    return Documentacion(
      documentos: List<String>.from(map['documentos'] ?? []),
    );
  }
}
