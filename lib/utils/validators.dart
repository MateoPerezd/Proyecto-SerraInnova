
//==============================
//  VALIDATORS
//===========================

class Validators {
  // =========================
  // TEXTO GENERAL
  // =========================
  static String? required(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName obligatorio';
    }
    return null;
  }

  // =========================
  // EMAIL
  // =========================
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email obligatorio';
    }

    final emailRegex =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Email inválido';
    }

    return null;
  }

  // =========================
  // TELÉFONO
  // =========================
  static String? telefono(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Teléfono obligatorio';
    }

    if (!RegExp(r'^\d{9}$').hasMatch(value)) {
      return 'Teléfono inválido';
    }

    return null;
  }

  // =========================
  // DNI / NIE
  // =========================
  static String? dniNie(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'DNI / NIE obligatorio';
    }

    final v = value.toUpperCase();

    final dni = RegExp(r'^\d{8}[A-Z]$');
    final nie = RegExp(r'^[XYZ]\d{7}[A-Z]$');

    if (!dni.hasMatch(v) && !nie.hasMatch(v)) {
      return 'Formato de DNI / NIE inválido';
    }

    return null;
  }

  // =========================
  // CÓDIGO POSTAL
  // =========================
  static String? codigoPostal(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Código postal obligatorio';
    }

    if (!RegExp(r'^\d{5}$').hasMatch(value)) {
      return 'Código postal inválido';
    }

    return null;
  }

  // =========================
  // NÚMEROS POSITIVOS
  // =========================
  static String? numeroPositivo(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName obligatorio';
    }

    final n = double.tryParse(value);
    if (n == null || n <= 0) {
      return '$fieldName inválido';
    }

    return null;
  }

// ---------- AÑO CONSTRUCCIÓN ----------
  static String? anioConstruccion(String? value) {
    if (value == null || value.isEmpty) return null;
    final year = int.tryParse(value);
    final currentYear = DateTime.now().year;
    if (year == null || year < 1800 || year > currentYear) {
      return 'Año inválido';
    }
    return null;
  }

  // ---------- PRECIO ----------
  static String? precio(String? value) {
    if (value == null || value.isEmpty) return null;
    final parsed = double.tryParse(value);
    if (parsed == null || parsed < 0) {
      return 'Precio inválido';
    }
    return null;
  }

  // ---------- SUPERFICIE ----------
  static String? superficie(String? value) {
    if (value == null || value.isEmpty) {
      return 'Superficie obligatoria';
    }
    final parsed = double.tryParse(value);
    if (parsed == null || parsed <= 0) {
      return 'Superficie inválida';
    }
    return null;
  }

  // ---------- ENTEROS POSITIVOS ----------
  static String? positiveInt(String? value) {
    if (value == null || value.isEmpty) return 'Campo obligatorio';
    final parsed = int.tryParse(value);
    if (parsed == null || parsed < 0) {
      return 'Valor inválido';
    }
    return null;
  }

// -------FECHA-------

static String? fechaDisponibilidad(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Selecciona una fecha de disponibilidad';
  }
  return null;
}



}
