import 'package:flutter/material.dart';
import '../widgets/form_template.dart';
import '../routes/app_routes.dart';

/// ---------------------------------------------------------------------------
/// CONFIRMACIÓN DE REGISTRO
/// ---------------------------------------------------------------------

class ConfirmacionRegistroPage extends StatelessWidget {
  const ConfirmacionRegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormTemplate(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // ICONO CHECK
              Container(
                width: 96,
                height: 96,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8F5E9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 56,
                  color: Color(0xFF2E7D32),
                ),
              ),

              const SizedBox(height: 24),

              // TÍTULO
              
              const Text(
                '¡Registro completado!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1B5E20),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              // DESCRIPCIÓN
              const Text(
                'El inmueble ha sido registrado correctamente.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF1B5E20),
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // BOTÓN VOLVER A INICIO
              SizedBox(
                width: 220,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamedAndRemoveUntil(
                      AppRoutes.home,
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B5E20),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                    textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: const Text('Volver a inicio'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
