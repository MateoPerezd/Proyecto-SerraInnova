import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../models/propietario.dart';
import '../providers/inmueble_provider.dart';
import '../widgets/buttons_form.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_document_item.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/form_template.dart';
import '../utils/validators.dart';

//========================
// REGISTRO  DE INMUEBLE
//=========================

class RegistroInmueblePage extends StatefulWidget {
  const RegistroInmueblePage({super.key});

  @override
  State<RegistroInmueblePage> createState() => _RegistroInmueblePageState();
}

class _RegistroInmueblePageState extends State<RegistroInmueblePage> {
  final _formKey = GlobalKey<FormState>();
  late Propietario propietario;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Recupera el propietario pasado por navegación

    propietario = ModalRoute.of(context)?.settings.arguments as Propietario;
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InmuebleProvider>();

    return Scaffold(
      body: FormTemplate(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Registro de inmueble.',
                style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              height: 1.3,
              color: Color(0xFF1F2A7A),
            ),
              ),
              const SizedBox(height: 8),
              Text(
                'Propietario: ${propietario.nombre} ${propietario.apellidos}',
              style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 1.4,
              color: Color(0xFF1F2A7A),
            ),),
              const SizedBox(height: 24),

          // ==============
          // SECCIONES DEL FORMULARIO TIPO ACORDEON
          //=================================

              _note(provider, 0, 'Información del inmueble',
                  _buildInformacion(provider)),
              _note(provider, 1, 'Sostenibilidad',
                  _buildSostenibilidad(provider)),
              _note(provider, 2, 'Finalidad social',
                  _buildFinalidadSocial(provider)),
              _note(provider, 3, 'Condiciones económicas',
                  _buildCondiciones(provider)),
              _note(provider, 4, 'Documentación',
                  _buildDocumentacion(provider)),
              _note(provider, 5, 'Autorizaciones',
                  _buildAutorizaciones(provider)),

              const SizedBox(height: 32),

              // ===========================
              // BOTONES DE ACCION
              //============================

              FormFooterButtons(
                onCancel: () => Navigator.pop(context),
                onContinue: () =>
                    provider.submit(context, _formKey, propietario),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ========================================================================
  // ITEM DE ACORDEON
  // =====================================================================


  Widget _note(
    InmuebleProvider provider,
    int index,
    String title,
    Widget content,
  ) {
    final expanded = provider.expandedIndex == index;

    return Container(
      
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
      border: Border.all(
      color: Color(0xFF1B5E20),
      width: 1,
    ),
     borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(title,
            style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1B5E20),
        ),),
            trailing: Icon(
              expanded ? Icons.expand_less : Icons.expand_more,
            ),
            onTap: () => provider.togglePanel(index),
          ),
          if (expanded) Padding(padding: const EdgeInsets.all(16), child: content)
        
        
        ],
      
      ),
    );
    

  }

  // ========================================================================
  // INFORMACIÓN DEL INMUEBLE
  // ========================================================================

  Widget _buildInformacion(InmuebleProvider p) {
  return Column(
    children: [
      // Tipo de inmueble
      CustomDropdown(
        label: 'Tipo de inmueble',
        requiredField: true,
        value: p.tipoInmueble,
        items: const ['Piso', 'Casa', 'Chalet', 'Local'],
        onChanged: (v) => p.tipoInmueble = v,
      ),

      const SizedBox(height: 5),

      // Tipo de oferta
      CustomDropdown(
        label: 'Tipo de oferta',
        requiredField: true,
        value: p.tipoOferta,
        items: const ['Venta', 'Alquiler', 'Ambas'],
        onChanged: (v) => p.tipoOferta = v,
      ),

      const SizedBox(height: 5),

      // Dirección
      CustomTextField(
        label: 'Dirección',
        hint: 'Calle, número, piso, puerta',
        controller: p.direccionController,
        requiredField: true,
      ),

      const SizedBox(height: 5),

      // Ciudad / Código postal
      Row(
        children: [
          Expanded(
            child: CustomTextField(
              label: 'Ciudad',
              controller: p.ciudadController,
              requiredField: true,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CustomTextField(
              label: 'Código postal',
              controller: p.codigoPostalController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(5),
              ],
              validator: Validators.codigoPostal,
              requiredField: true,
            ),
          ),
        ],
      ),

      const SizedBox(height: 5),

      // Año / Superficie / Habitaciones / Baños
      Row(
        children: [
          Expanded(
            child: CustomTextField(
              label: 'Año de construcción',
              controller: p.anioConstruccionController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
              validator: Validators.anioConstruccion,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CustomTextField(
              label: 'Superficie (m²)',
              controller: p.superficieController,
              keyboardType: TextInputType.number,
              validator: Validators.superficie,
              requiredField: true,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CustomTextField(
              label: 'Habitaciones',
              controller: p.habitacionesController,
              keyboardType: TextInputType.number,
              validator: Validators.positiveInt,
              requiredField: true,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CustomTextField(
              label: 'Baños',
              controller: p.banosController,
              keyboardType: TextInputType.number,
              validator: Validators.positiveInt,
              requiredField: true,
            ),
          ),
        ],
      ),

      const SizedBox(height: 5),

      // Estado del inmueble
      CustomDropdown(
        label: 'Estado del inmueble',
        requiredField: true,
        value: p.estadoInmueble,
        items: const ['Nuevo', 'Buen estado', 'A reformar'],
        onChanged: (v) => p.estadoInmueble = v,
      ),

      const SizedBox(height: 5),

      // Descripción
      CustomTextField(
        label: 'Descripción adicional',
        controller: p.descripcionController,
        maxLines: 2,
      ),
    ],
  );
}

  // ========================================================================
  // SOSTENIBILIDAD
  // =====================================================================

 Widget _buildSostenibilidad(InmuebleProvider p) {
  return Column(
    children: [
      // Certificado energético
      CustomDropdown(
        label: 'Certificado energético',
        value: p.certificadoEnergetico,
        items: const ['A', 'B', 'C', 'D', 'E', 'F', 'G'],
        onChanged: (v) => p.certificadoEnergetico = v,
      ),

      // Uso de energías renovables
      CustomCheckbox(
        label: 'Uso de energías renovables',
        value: p.usaEnergiasRenovables,
        onChanged: (v) { setState(() { p.usaEnergiasRenovables = v!; }); },
      ),

      // Materiales sostenibles
      CustomCheckbox(
        label: 'Materiales sostenibles',
        value: p.materialesSostenibles,
        onChanged: (v) { setState(() { p.materialesSostenibles = v!; }); },
      ),

      const SizedBox(height: 12),

      // Consumo energético estimado
      CustomDropdown(
        label: 'Consumo energético estimado',
        value: p.consumoEnergetico,
        items: const ['Alta', 'Media', 'Baja'],
        onChanged: (v) { setState(() { p.consumoEnergetico = v!; }); },
      ),
    ],
  );
}

  // ========================================================================
  // FINALIDAD SOCIAL
  // ======================================================================

 Widget _buildFinalidadSocial(InmuebleProvider p) {
  return Column(
    children: [
      CustomCheckbox(
        label: 'Adaptado para movilidad reducida',
        value: p.adaptadoMovilidadReducida,
        onChanged: (v) { setState(() { p.adaptadoMovilidadReducida = v!; }); },
      ),

      CustomCheckbox(
        label: 'Acepta colectivos vulnerables',
        value: p.aceptaColectivosVulnerables,
        onChanged: (v) { setState(() { p.aceptaColectivosVulnerables = v!; }); },
      ),

      CustomCheckbox(
        label: 'Mascotas permitidas',
        value: p.mascotasPermitidas,
        onChanged: (v) { setState(() { p.mascotasPermitidas = v!; }); },
      ),
    ],
  );
}

// ========================================================================
  // CONDICIONES ECONÓMICAS
  // ====================================================================
  Widget _buildCondiciones(InmuebleProvider p) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: CustomTextField(
              label: 'Precio de venta',
              controller: p.precioVentaController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: Validators.precio,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CustomTextField(
              label: 'Precio de alquiler',
              controller: p.precioAlquilerController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: Validators.precio,
            ),
          ),
        ],
      ),

      CustomTextField(
        label: 'Fianza',
        controller: p.fianzaController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),

      CustomTextField(
        label: 'Fecha de disponibilidad',
        controller: p.fechaDisponibilidadController,
        readOnly: true,
        validator: Validators.fechaDisponibilidad,
        onTap: () async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: p.fechaDisponibilidad ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 5),
      ),
      locale: const Locale('es', 'ES'),
    );

    if (pickedDate != null) {
      setState(() {
        p.fechaDisponibilidad = pickedDate;
        p.fechaDisponibilidadController.text =
            '${pickedDate.day.toString().padLeft(2, '0')}/'
            '${pickedDate.month.toString().padLeft(2, '0')}/'
            '${pickedDate.year}';
      });
    }
  },

      ),

      CustomTextField(
        label: 'Observaciones adicionales',
        controller: p.observacionesController,
        maxLines: 2,
      ),
    ],
  );
}

// ========================================================================
  // DOCUMENTACIÓN
  // =====================================================================
 Widget _buildDocumentacion(InmuebleProvider p) {
  return Column(
    children: [
      CustomDocumentItem(
        label: 'Escritura',
        file: p.escritura,
        onSelected: (f) => p.escritura = f,
      ),

      CustomDocumentItem(
        label: 'Certificado energético',
        file: p.certificado,
        onSelected: (f) => p.certificado = f,
      ),

      CustomDocumentItem(
        label: 'Cédula',
        file: p.cedula,
        onSelected: (f) => p.cedula = f,
      ),

      CustomDocumentItem(
        label: 'Fotografías',
        file: p.fotografias.isNotEmpty ? p.fotografias.first : null,
        onSelected: (f) => p.fotografias = [f],
      ),

      const SizedBox(height: 8),

      const Text(
        'Adjunta la documentación necesaria para continuar.',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    ],
  );
}

// ========================================================================
  // AUTORIZACIONES Y CONSENTIMIENTOS
  // =====================================================================
  
  Widget _buildAutorizaciones(InmuebleProvider p) {
  return Column(
    children: [
      CustomCheckbox(
        label: 'Acepto las condiciones del servicio',
        value: p.aceptaCondiciones,
        onChanged: (v) { setState(() { p.aceptaCondiciones = v!; }); },
      ),

      CustomCheckbox(
        label: 'Consiento el uso de mis datos personales',
        value: p.aceptaUsoDatos,
        onChanged: (v) { setState(() { p.aceptaUsoDatos = v!; }); },
      ),

      const SizedBox(height: 8),

      const Text(
        'Debes aceptar ambas condiciones para continuar.',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    ],
  );
}

}
