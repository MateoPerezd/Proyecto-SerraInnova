class Propietario {
  final String? id;
  final String nombre;
  final String apellidos;
  final String dniNie;
  final String telefono;
  final String email;
  final String direccion;
  final String ciudad;
  final String codigoPostal;

  Propietario({
    this.id,
    required this.nombre,
    required this.apellidos,
    required this.dniNie,
    required this.telefono,
    required this.email,
    required this.direccion,
    required this.ciudad,
    required this.codigoPostal,
  });

  /// Convierte el objeto a Map para Firebase
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'apellidos': apellidos,
      'dniNie': dniNie,
      'telefono': telefono,
      'email': email,
      'direccion': direccion,
      'ciudad': ciudad,
      'codigoPostal': codigoPostal,
    };
  }

  /// Crea un objeto Propietario desde Firebase
  factory Propietario.fromMap(
  Map<String, dynamic> map,
  String id,
) {
  return Propietario(
    id: id,
    nombre: map['nombre'] ?? '',
    apellidos: map['apellidos'] ?? '',
    dniNie: map['dniNie'] ?? '',
    telefono: map['telefono'] ?? '',
    email: map['email'] ?? '',
    direccion: map['direccion'] ?? '',
    ciudad: map['ciudad'] ?? '',
    codigoPostal: map['codigoPostal'] ?? '',
  );
}


  Propietario copyWith({String? id}) {
  return Propietario(
    id: id ?? this.id,
    nombre: nombre,
    apellidos: apellidos,
    dniNie: dniNie,
    telefono: telefono,
    email: email,
    direccion: direccion,
    ciudad: ciudad,
    codigoPostal: codigoPostal,
  );
}

}
