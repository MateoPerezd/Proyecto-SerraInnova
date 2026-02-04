import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/registro_propietario_page.dart';
import '../pages/registro_inmueble_page.dart';
import '../pages/confirmacion_registro_page.dart';
import '../pages/ficha_inmueble_page.dart';
import '../pages/listado_inmuebles_page.dart';


class AppRoutes {
  static const home = '/';
  static const registroPropietario = '/registro-propietario';
  static const registroInmueble = '/registro-inmueble';
  static const confirmacion = '/confirmacion';
  static const listadoInmuebles = '/inmuebles';
  static const fichaInmueble = '/ficha-inmueble';


  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomePage(),
        registroPropietario: (context) => const RegistroPropietarioPage(),
        registroInmueble: (context) => const RegistroInmueblePage(),
        confirmacion: (context) => const ConfirmacionRegistroPage(),
        listadoInmuebles: (_) => const ListadoInmueblesPage(),
         fichaInmueble: (_) => const FichaInmueblePage(),
      };

     

}
