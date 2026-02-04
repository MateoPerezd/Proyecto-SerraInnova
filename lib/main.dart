import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'firebase_options.dart';
import 'routes/app_routes.dart';
import 'providers/propietario_provider.dart';
import 'providers/inmueble_provider.dart';

//=======================
// MAIN
//===================


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const SerraInnovaApp());
}

// APP

class SerraInnovaApp extends StatelessWidget {
  const SerraInnovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PropietarioProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => InmuebleProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SerraInnova',
        initialRoute: '/',
        routes: AppRoutes.routes,

        // LOCALIZACIÓN ( Hecho para que funcione el DatePicker)
        locale: const Locale('es', 'ES'),
        supportedLocales: const [
          Locale('es', 'ES'),
          Locale('en', 'US'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        
      ),
    );
  }
}
