import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

//================================
// APP HEADER
//===========================

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

// UTILIDAD RESPONSIVE

  bool _isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = _isMobile(context);

    return AppBar(
      backgroundColor: const Color(0xFF07212F),
      elevation: 0,
      centerTitle: isMobile, //  En mobile se centra, en web se mueve  a la izquierda
      //LOGO SERRAINNOVA
      title: Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8), 
      child: Column(
      mainAxisSize: MainAxisSize.min,
       
        children: const [
      Text(
        'SERRAINNOVA',
        
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: 2,
          color: Color(0xFF8BC34A),
        ),
      ),
      SizedBox(height: 2),
      Text(
        'INNOVATION',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 11,
          letterSpacing: 4,
          color: Color(0xFF8BC34A),
        ),
      ),
    ],
  ),
),
    
    // ACCIONES EN MOBILE ( solo se ven los iconos)
      actions: isMobile
          ? [
              IconButton(
                icon: const Icon(Icons.person_outline, color: Color(0xFFE1F7D3),),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.menu, color: Color(0xFFE1F7D3),),
                onPressed: () {},
              ),
            ]
          :  [
            // ACCIONES EN WEB
  Center(
    child: TextButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true)
            .pushNamedAndRemoveUntil(
          AppRoutes.home,
          (route) => false,
        );
      },
      child: const Text(
        'Inicio',
        style: TextStyle(
          color: Color(0xFFE1F7D3),
          fontSize: 18,
        ),
      ),
    ),
  ),
  Center(
    child: TextButton(
      onPressed: () {},
      child: const Text(
        'Quienes somos',
        style: TextStyle(
          color: Color(0xFFE1F7D3),
          fontSize: 18,
        ),
      ),
    ),
  ),
  Center(
    child: TextButton(
      onPressed: () {
        Navigator.pushNamed(
      context,
      AppRoutes.listadoInmuebles,
    );
        
      },
      child: const Text(
        'Inmuebles',
        style: TextStyle(
          color: Color(0xFFE1F7D3),
          fontSize: 18,
        ),
      ),
    ),
  ),
  Center(
    child: TextButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          AppRoutes.registroPropietario,
        );
      },
      child: const Text(
        'Registrar',
        style: TextStyle(
          color: Color(0xFFE1F7D3),
          fontSize: 18,
        ),
      ),
    ),
  ),
  Center(
    child: IconButton(
      icon: const Icon(Icons.person_outline,
          color: Color(0xFFE1F7D3)),
      onPressed: () {},
    ),
  ),
  Center(
    child: IconButton(
      icon: const Icon(Icons.menu,
          color: Color(0xFFE1F7D3)),
      onPressed: () {},
    ),
  ),
],
    );
  }

// ALTURA DEL APPBAR
  @override
  Size get preferredSize => const Size.fromHeight(72);
}
