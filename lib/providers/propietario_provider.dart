import 'package:flutter/material.dart';

import '../models/propietario.dart';
import '../services/propietario_service.dart';

//========================================
//     PROPIETARIO PROVIDER
//=======================================

/// Estados del flujo de registro de propietario
enum RegistroPropietarioView {
  sinPropietario,
  seleccionarExistente,
  crearNuevo,
}

// Controllers
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();
  final TextEditingController dniController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController ciudadController = TextEditingController();
  final TextEditingController codigoPostalController = TextEditingController();

class PropietarioProvider extends ChangeNotifier {
  final PropietarioService _service = PropietarioService();

  /// Estado del flujo
  RegistroPropietarioView currentView =
  RegistroPropietarioView.sinPropietario;

  /// Datos
  List<Propietario> propietarios = [];
  Propietario? propietarioSeleccionado;

  /// =========================
  /// Cargar propietarios existentes
  /// =========================
  Future<void> cargarPropietarios() async {
    final list = await _service.getPropietarios();
    propietarios = list;

    currentView = propietarios.isEmpty
        ? RegistroPropietarioView.sinPropietario
        : RegistroPropietarioView.seleccionarExistente;

    notifyListeners();
  }

  /// =========================
  /// Cambiar vista (existente / nuevo)
  /// =========================
  void cambiarVista(RegistroPropietarioView view) {
    currentView = view;
    notifyListeners();
  }

  /// =========================
  /// Seleccionar propietario existente
  /// =========================
  /// 
  void seleccionarPropietario(Propietario propietario) {
    propietarioSeleccionado = propietario;
    notifyListeners();
  }

  /// =========================
  /// Crear nuevo propietario
  /// =========================
  Future<Propietario> crearPropietario(
    Propietario nuevo,
  ) async {
    final saved = await _service.createPropietario(nuevo);
    return saved;
  }

  /// =========================
  /// Validar si se puede continuar
  /// =========================
  
  bool get puedeContinuar {
    if (currentView == RegistroPropietarioView.seleccionarExistente) {
      return propietarioSeleccionado != null;
    }
    return true;
  }

  /// =========================
  /// Reset del provider
  /// =========================
  void reset() {
    propietarios = [];
    propietarioSeleccionado = null;
    currentView = RegistroPropietarioView.sinPropietario;
    notifyListeners();
  }

  @override
  void dispose() {
    nombreController.dispose();
    apellidosController.dispose();
    dniController.dispose();
    telefonoController.dispose();
    emailController.dispose();
    direccionController.dispose();
    ciudadController.dispose();
    codigoPostalController.dispose();
    super.dispose();
  }
}
