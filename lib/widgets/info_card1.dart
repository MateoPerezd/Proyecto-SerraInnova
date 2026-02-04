import 'package:flutter/material.dart';

class InfoCardSmall extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const InfoCardSmall({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD7F0C2), // verde claro mockup
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ICONO
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF8BC34A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 22,
            ),
          ),

          const SizedBox(width: 12),

          // TEXTO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1B5E20),
                  ),
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      height: 1.4,
                      color: Color(0xFF2E7D32),
                    ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
