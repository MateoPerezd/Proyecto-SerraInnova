import 'package:flutter/material.dart';

//============================
// TARJETA 2 HOME PAGE ( QUIENES SOMOS)
//==============================


class InfoCardLarge extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const InfoCardLarge({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 36,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFD7F0C2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //  Imagen circular
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 20),

          //  Título
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1B5E20),
            ),
          ),

          const SizedBox(height: 12),

          //  Descripción
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              height: 1.5,
              color: Color(0xFF2E7D32),
            ),
          ),
        ],
      ),
    );
  }
}
