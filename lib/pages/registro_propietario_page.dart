import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../providers/propietario_provider.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/form_template.dart';
import '../widgets/buttons_form.dart';
import '../routes/app_routes.dart';
import '../models/propietario.dart';
import '../utils/validators.dart';

/// ---------------------------------------------------------------------------
/// REGISTRO DE PROPIETARIO
/// ---------------------------------------------------------------------------

class RegistroPropietarioPage extends StatefulWidget {
  const RegistroPropietarioPage({super.key});

  @override
  State<RegistroPropietarioPage> createState() =>
      _RegistroPropietarioPageState();
}

class _RegistroPropietarioPageState extends State<RegistroPropietarioPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();
  final TextEditingController dniController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  final TextEditingController ciudadController = TextEditingController();
  final TextEditingController codigoPostalController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Cargar propietarios existentes al iniciar
    Future.microtask(
      () => context.read<PropietarioProvider>().cargarPropietarios(),
    );
  }

  @override
  Widget build(BuildContext context) {

    
    final provider = context.watch<PropietarioProvider>();

    return FormTemplate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gestión de propietario.',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              height: 1.3,
              color: Color(0xFF1F2A7A),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Registra y guarda tus datos.',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 1.4,
              color: Color(0xFF1F2A7A),
            ),
          ),
          const SizedBox(height: 24),

          // Selector de vista (existente / nuevo)
          
          _buildSelectorPropietario(provider),

          const SizedBox(height: 32),

          // Contenido dinámico dentro del Form
          Form(
            key: _formKey,
            child: _buildContenidoDinamico(provider),
          ),

          const SizedBox(height: 32),

          // Botones
          FormFooterButtons(
            onCancel: () => Navigator.pop(context),
            onContinue: () async {
              // Si está en "crear nuevo", validar
              if (provider.currentView == RegistroPropietarioView.crearNuevo) {
                final isValid = _formKey.currentState?.validate() ?? false;
                if (!isValid) return;

                final nuevo = Propietario(
                  nombre: nombreController.text.trim(),
                  apellidos: apellidosController.text.trim(),
                  dniNie: dniController.text.trim(),
                  telefono: telefonoController.text.trim(),
                  email: emailController.text.trim(),
                  direccion: direccionController.text.trim(),
                  ciudad: ciudadController.text.trim(),
                  codigoPostal: codigoPostalController.text.trim(),
                );

                final saved = await provider.crearPropietario(nuevo);
                _goToInmueble(saved);
                return;
              }

              // Si está en "seleccionar existente"
              if (provider.currentView ==
                  RegistroPropietarioView.seleccionarExistente) {
                if (!provider.puedeContinuar) {
                  _showError('Selecciona un propietario');
                  return;
                }
                _goToInmueble(provider.propietarioSeleccionado!);
                return;
              }

              // Si está en "noOwners" (sin propietarios)
              _showError(
                'No hay propietarios registrados. Selecciona "Nuevo propietario".',
              );
            },
          ),
        ],
      ),
    );
  }

  // =========================
  // CONTENIDO DINÁMICO
  // =========================
  Widget _buildContenidoDinamico(PropietarioProvider provider) {
    switch (provider.currentView) {
      case RegistroPropietarioView.sinPropietario:
        return _buildAlerta();
      case RegistroPropietarioView.seleccionarExistente:
        return _buildSeleccionarExistente(provider);
      case RegistroPropietarioView.crearNuevo:
        return _buildCrearNuevo();
    }
  }

  Widget _buildAlerta() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8CC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF8A6D3B),
          width: 2,
        ),
      ),
      child: Row(
        children: const [
          Icon(
            Icons.warning_amber_rounded,
            color: Color(0xFF8A6D3B),
            size: 24,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'No hay propietarios registrados. '
              'Seleccione "Nuevo propietario" para continuar.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                height: 1.4,
                color: Color(0xFF6B5E2E),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // SELECCIONAR PROPIETARIO EXISTENTE
  // =========================
  Widget _buildSeleccionarExistente(PropietarioProvider provider) {
    return DropdownButtonFormField<Propietario>(
      value: provider.propietarioSeleccionado,
      hint: const Text('Seleccione un propietario'),
      items: provider.propietarios
          .map(
            (p) => DropdownMenuItem(
              value: p,
              child: Text('${p.nombre} ${p.apellidos}'),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value != null) {
          provider.seleccionarPropietario(value);
        }
      },
    );
  }

  // =========================
  // CREAR NUEVO PROPIETARIO ( Formulario )
  // =========================
  Widget _buildCrearNuevo() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: 'Nombre',
                controller: nombreController,
                requiredField: true,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextField(
                label: 'Apellidos',
                controller: apellidosController,
                requiredField: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: 'DNI / NIE',
                controller: dniController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9XYZxyzA-Za-z]'),
                  ),
                ],
                validator: Validators.dniNie,
                requiredField: true,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextField(
                label: 'Teléfono',
                controller: telefonoController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(9),
                ],
                validator: Validators.telefono,
                requiredField: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        CustomTextField(
          label: 'Email',
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          validator: Validators.email,
          requiredField: true,
        ),
        const SizedBox(height: 12),

        CustomTextField(
          label: 'Dirección',
          controller: direccionController,
          requiredField: true,
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: 'Ciudad',
                controller: ciudadController,
                requiredField: true,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextField(
                label: 'Código postal',
                controller: codigoPostalController,
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
      ],
    );
  }

  // =========================
  // SELECTOR EXISTENTE / NUEVO
  // =========================
  Widget _buildSelectorPropietario(PropietarioProvider provider) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => provider
                .cambiarVista(RegistroPropietarioView.seleccionarExistente),
                icon: const Icon(Icons.radio_button_checked,
                color: Color(0xFF1F2A7A)),
            label: const Text(
            'Seleccionar existente',
            style: TextStyle(
              fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2A7A),

            ),
          ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () =>
              provider.cambiarVista(RegistroPropietarioView.crearNuevo),
              icon: const Icon(
                Icons.person_add,
                color: Color(0xFF1B5E20),
              ),
               label: const Text(
              'Nuevo propietario',
            style: TextStyle(
              fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            color: Color(0xFF1B5E20),
              ),
          ),
          ),
        ),
      ],
    );
  }

  // =========================
  // NAVEGACIÓN + ERRORES
  // =========================
  void _goToInmueble(Propietario propietario) {
    Navigator.pushNamed(
      context,
      AppRoutes.registroInmueble,
      arguments: propietario,
    );
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
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