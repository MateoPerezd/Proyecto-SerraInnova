import 'dart:io';
import 'package:flutter/material.dart';

import '../models/autorizacion.dart';
import '../models/condiciones.dart';
import '../models/documentacion.dart';
import '../models/finalidad_social.dart';
import '../models/informacion_inmueble.dart';
import '../models/inmueble.dart';
import '../models/propietario.dart';
import '../models/sostenibilidad.dart';
import '../routes/app_routes.dart';
import '../services/inmueble_services.dart';

/// -----------------------------------------------------------
/// INMUEBLE PROVIDER
/// -----------------------------------------------------------------

class InmuebleProvider extends ChangeNotifier {
  final InmuebleService _service = InmuebleService();

  // =========================
  // ESTADO GENERAL
  // =========================
  int? expandedIndex;

// Alterna el panel expandido del acordeon

  void togglePanel(int index) {
    expandedIndex = expandedIndex == index ? null : index;
    notifyListeners();
  }

  // =========================
  // INFORMACIÓN DEL INMUEBLE
  // =========================
  String? tipoInmueble;
  String? tipoOferta;
  String? estadoInmueble;

//Controllers

  final direccionController = TextEditingController();
  final ciudadController = TextEditingController();
  final codigoPostalController = TextEditingController();
  final superficieController = TextEditingController();
  final habitacionesController = TextEditingController();
  final banosController = TextEditingController();
  final descripcionController = TextEditingController();
  final anioConstruccionController = TextEditingController();

  // Construye el modelo InformacionInmueble

  InformacionInmueble buildInformacion() {
    return InformacionInmueble(
      tipoInmueble: tipoInmueble!,
      tipoOferta: tipoOferta!,
      direccion: direccionController.text,
      ciudad: ciudadController.text,
      codigoPostal: codigoPostalController.text,
      anioConstruccion: anioConstruccionController.text.isEmpty
          ? null
          : int.parse(anioConstruccionController.text),
      superficie: double.parse(superficieController.text),
      habitaciones: int.parse(habitacionesController.text),
      banos: int.parse(banosController.text),
      estado: estadoInmueble!,
      descripcion:
          descripcionController.text.isEmpty ? null : descripcionController.text,
    );
  }

  // =========================
  // SOSTENIBILIDAD
  // =========================

  String? certificadoEnergetico;
  String? consumoEnergetico;
  bool usaEnergiasRenovables = false;
  bool materialesSostenibles = false;

// Construye el modelo Sostenibilidad

  Sostenibilidad buildSostenibilidad() {
    return Sostenibilidad(
      certificadoEnergetico: certificadoEnergetico,
      consumoEstimado: consumoEnergetico,
      energiasRenovables: usaEnergiasRenovables ? ['Solar'] : [],
      materialesSostenibles:
          materialesSostenibles ? 'Materiales sostenibles' : null,
    );
  }

  // =========================
  // FINALIDAD SOCIAL
  // =========================

  bool adaptadoMovilidadReducida = false;
  bool aceptaColectivosVulnerables = false;
  bool mascotasPermitidas = false;

// Construye el modelo FinalidadSocial

  FinalidadSocial buildFinalidadSocial() {
    return FinalidadSocial(
      adaptadoMovilidadReducida: adaptadoMovilidadReducida,
      aceptaColectivosVulnerables: aceptaColectivosVulnerables,
      permiteMascotas: mascotasPermitidas,
    );
  }

  // =========================
  // CONDICIONES ECONÓMICAS
  // =========================

  final precioVentaController = TextEditingController();
  final precioAlquilerController = TextEditingController();
  final fianzaController = TextEditingController();
  final observacionesController = TextEditingController();
  final fechaDisponibilidadController = TextEditingController();

  DateTime? fechaDisponibilidad;

// Construye el modelo Condiciones

  Condiciones buildCondiciones() {
    return Condiciones(
      precioVenta: precioVentaController.text.isEmpty
          ? null
          : double.parse(precioVentaController.text),
      precioAlquiler: precioAlquilerController.text.isEmpty
          ? null
          : double.parse(precioAlquilerController.text),
      fianza: fianzaController.text.isEmpty
          ? null
          : double.parse(fianzaController.text),
      observaciones: observacionesController.text,
      fechaDisponibilidad: fechaDisponibilidad,
    );
  }

  // =========================
  // DOCUMENTACIÓN
  // =========================

  File? escritura;
  File? certificado;
  File? cedula;
  List<File> fotografias = [];

  Documentacion buildDocumentacion() {
    return Documentacion(
      documentos: [
        if (escritura != null) escritura!.path,
        if (certificado != null) certificado!.path,
        if (cedula != null) cedula!.path,
        ...fotografias.map((f) => f.path),
      ],
    );
  }

  // =========================
  // AUTORIZACIONES
  // =========================

  bool aceptaCondiciones = false;
  bool aceptaUsoDatos = false;

// Construye el modelo AutorizacionConsentimiento

  AutorizacionConsentimiento buildAutorizacion() {
    return AutorizacionConsentimiento(
      autorizaPublicacion: aceptaCondiciones,
      autorizaDatosPersonales: aceptaUsoDatos,
      declaraVeracidad: true,
    );
  }

  // =========================
  // SUBMIT FINAL CON VALIDACIONES
  // =========================
  Future<void> submit(
    BuildContext context,
    GlobalKey<FormState> formKey,
    Propietario propietario,
  ) async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    if (tipoInmueble == null || tipoOferta == null || estadoInmueble == null) {
      _snack(context, 'Completa todos los campos obligatorios');
      return;
    }

    if (fechaDisponibilidad == null) {
      _snack(context, 'Selecciona la fecha de disponibilidad');
      return;
    }

    if (!aceptaCondiciones || !aceptaUsoDatos) {
      _snack(context, 'Debes aceptar las condiciones');
      return;
    }

  // Construcción del modelo final

    final inmueble = Inmueble(
      propietarioId: propietario.id!,
      informacion: buildInformacion(),
      sostenibilidad: buildSostenibilidad(),
      finalidadSocial: buildFinalidadSocial(),
      condiciones: buildCondiciones(),
      documentacion: buildDocumentacion(),
      autorizacion: buildAutorizacion(),
    );

 // Persistencia
    await _service.createInmueble(inmueble);

    if (!context.mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.confirmacion,
      (_) => false,
    );
  }

 /// Muestra feedback al usuario
 
  void _snack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    direccionController.dispose();
    ciudadController.dispose();
    codigoPostalController.dispose();
    superficieController.dispose();
    habitacionesController.dispose();
    banosController.dispose();
    descripcionController.dispose();
    anioConstruccionController.dispose();
    precioVentaController.dispose();
    precioAlquilerController.dispose();
    fianzaController.dispose();
    observacionesController.dispose();
    fechaDisponibilidadController.dispose();
    super.dispose();
  }
}
