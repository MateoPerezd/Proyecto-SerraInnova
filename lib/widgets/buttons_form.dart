import 'package:flutter/material.dart';

// -----------------------------------------------
/// BOTONES DE FORMULARIO
/// --------------------

class FormFooterButtons extends StatelessWidget {

  // Acción al presionar "Cancelar"

  final VoidCallback onCancel;

  // Acción al presionar "Guardar y continuar"

  final VoidCallback onContinue;

  const FormFooterButtons({
    super.key,
    required this.onCancel,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // CANCELAR
        Expanded(
          child: OutlinedButton(
            onPressed: onCancel,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF1F2A7A),
              side: const BorderSide(
                color: Color(0xFF1F2A7A),
                width: 1.5,
              ),
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            child: const Text('Cancelar', 
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14, 
              fontWeight: FontWeight.w300,
              height: 1.4,
              
            ),),
          ),
        ),

        const SizedBox(width: 24),

        // GUARDAR Y CONTINUAR
        Expanded(
          child: ElevatedButton(
            onPressed: onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B5E20),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            child: const Text('Guardar y continuar',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14, 
              fontWeight: FontWeight.w300,
              height: 1.4,
              color: Color(0xFFFFFFFF
            ),),
            ),
            
          ),
        ),
      ],
    );
  }
}
