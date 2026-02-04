import 'package:flutter/material.dart';


//==========================
//  APP FOOTER
//=========================

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});


// UTILIDAD RESPONSIVE

  bool _isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = _isMobile(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      color: const Color(0xFF07212F),
      child: isMobile ? _mobileFooter() : _webFooter(),
    );
  }

  // LAYOUTS


  // ────────────── WEB ──────────────
  Widget _webFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _socialIcons(),
        _copyright(),
        _links(alignment: CrossAxisAlignment.end),
      ],
    );
  }

  // ────────────── MOBILE ──────────────

  Widget _mobileFooter() {
    return Column(
      children: [
        _socialIcons(),
        const SizedBox(height: 16),
        _copyright(),
        const SizedBox(height: 16),
       
      ],
    );
  }

  // ────────────── COMPONENTES ──────────────

  // iconos supuestas redes sociales

  Widget _socialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.camera_alt, color: Color(0xFFE1F7D3), size: 20),
        SizedBox(width: 16),
        Icon(Icons.facebook, color: Color(0xFFE1F7D3), size: 20),
        SizedBox(width: 16),
        Icon(Icons.business, color: Color(0xFFE1F7D3), size: 20),
      ],
    );
  }

// Copyright 

  Widget _copyright() {
    return const Text(
      'Copyright © 2026 Serrainnova.',
      style: TextStyle(
        color: Color(0xFFE1F7D3),
        fontSize: 12,
        fontFamily: 'Inter',
      ),
      textAlign: TextAlign.center,
    );
  }


// Supuestos enlances a la pagina

  Widget _links({required CrossAxisAlignment alignment}) {
    return Column(
      crossAxisAlignment: alignment,
      children: const [
        Text(
          'Sobre Serrainnova',
          style: TextStyle(
            color: Color(0xFFE1F7D3),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '¿Quiénes somos?',
          style: TextStyle(
            color: Color(0xFFE1F7D3),
            fontSize: 11,
            fontFamily: 'Inter',
          ),
        ),
        Text(
          'Contáctanos.',
          style: TextStyle(
            color: Color(0xFFE1F7D3),
            fontSize: 11,
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }
}
