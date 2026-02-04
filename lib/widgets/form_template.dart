import 'package:flutter/material.dart';

//===========================
// PLANTILLA DE FONDO DE FORMULARIO
//=======================


class FormTemplate extends StatelessWidget {
  final Widget child;

  const FormTemplate({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              'assets/images/fondo_sostenible.png',
              fit: BoxFit.cover,
            ),
          ),

          
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width > 900
                    ? 900
                    : MediaQuery.of(context).size.width * 0.92,
                margin: const EdgeInsets.symmetric(vertical: 40),
                padding: const EdgeInsets.all(32),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.90), 
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 30,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),

                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
