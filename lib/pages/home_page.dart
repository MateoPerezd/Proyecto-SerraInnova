import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/app_footer.dart';
import '../routes/app_routes.dart';
import '../widgets/info_card1.dart';
import '../widgets/info_card2.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(),
      body: SingleChildScrollView(
  child: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFF8FFF2), // verde  suave
          Color(0xFFFDFBFF), // casi blanco
        ],
      ),
    ),
        child: Column(
          children: [
  // =========================
// SECCION PRINCIPAL
// =========================
Padding(
  padding: const EdgeInsets.fromLTRB(
    80,
    0, 
    80,
    24, 
  ),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // TEXTO
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Registra tu inmueble\nde forma sencilla y sostenible.',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 40,
                fontWeight: FontWeight.w600,
                height: 1.3, 
                color: Color(0xFF1F2A7A),
              ),
            ),

            const SizedBox(height: 12), 

            const Text(
              'Ingresa a nuestro sistema de gestión de inmuebles de forma sencilla, organizada y eficiente.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20, 
                fontWeight: FontWeight.w300,
                height: 1.4,
                color: Color(0xFF1F2A7A),
              ),
            ),

            const SizedBox(height: 20), 



          //----------------------------------------------
          //  BOTONES
          //----------------------------------------------
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.registroPropietario,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B5E20),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                    textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: const Text('Comenzar registro'),
                ),

                const SizedBox(width: 16),

                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF1B5E20),
                    side: const BorderSide(
                      color: Color(0xFF1B5E20),
                      width: 1.5,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                    textStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: const Text('Conocer más'),
                ),
              ],
            ),
          ],
        ),
      ),

      const SizedBox(width: 40),

      // IMAGEN PRINCIPAL
      Expanded(
        child: Image.asset(
          'assets/images/homepage.png',
          fit: BoxFit.contain,
        ),
      ),
    ],
  ),
),

// =========================
// CÓMO FUNCIONA
// =========================
Padding(
  padding: const EdgeInsets.fromLTRB(
    48,
    8, 
    48,
    32, 
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      const Text(
        'Cómo funciona',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 25,
          fontWeight: FontWeight.w600,
          height: 1.2,
          color: Color(0xFF1F2A7A),
        ),
      ),

      const SizedBox(height: 20), 
   
   
      IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Expanded(
              //CARD 1
              child: InfoCardSmall(
                icon: Icons.person,
                title: 'Gestión de propietario.',
                description:
                    'Llene sus datos una vez y reutilícelos para múltiples registros.',
              ),
            ),
            SizedBox(width: 18),
            Expanded(
              //CARD 2
              child: InfoCardSmall(
                icon: Icons.home,
                title: 'Registro de inmueble.',
                description:
                    'Formulario guiado paso a paso para obtener toda la información necesaria.',
              ),
            ),
            SizedBox(width: 18),
            Expanded(
              //CARD 3
              child: InfoCardSmall(
                icon: Icons.description,
                title: 'Documentación completa.',
                description:
                    'Incluya información sobre sostenibilidad, finalidad social y condiciones económicas.',
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),


      // =========================
      // QUIÉNES SOMOS
      // =========================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 60),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '¿Quiénes somos?',
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                        color: Color(0xFF1F2A7A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Te acompañamos para que vendas o alquiles tu propiedad.\n'
                    'Conectamos viviendas, personas y sostenibilidad en cada paso del proceso.',
                    style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          height: 1.4,
                          color: Color(0xFF1F2A7A),
                    
                    ),
                  ),
                  const SizedBox(height: 48),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Expanded(
                          //CARD 1
                          child: InfoCardLarge(
                            imagePath: 'assets/images/imgcard1.png',
                            title: 'Te acompañamos en cada paso.',
                            description:
                                'Te acompañamos durante todo el proceso de publicación de tu inmueble, facilitando la gestión y reutilización de tus datos para registrar propiedades de forma simple y eficiente.',
                          ),
                        ),
                        SizedBox(width: 24),
                        Expanded(
                          //CARD 2
                          child: InfoCardLarge(
                            imagePath: 'assets/images/imgcard2.png',
                            title: 'Sostenibilidad y compromiso.',
                            description:
                                'Integramos criterios de eficiencia energética, sostenibilidad y responsabilidad social desde el inicio, promoviendo un modelo inmobiliario más consciente y orientado al futuro.',
                          ),
                        ),
                        SizedBox(width: 24),
                        Expanded(
                          //CARD 3
                          child: InfoCardLarge(
                            imagePath: 'assets/images/imgcard3.png',
                            title: 'Impacto social positivo.',
                            description:
                                'Apostamos por una gestión inmobiliaria inclusiva, fomentando la accesibilidad, el respeto por las personas y la creación de comunidades más justas y responsables.',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // =========================
            // FOOTER
            // =========================
            const AppFooter(),
          ],
        ),
      ),
      ),
    );

  }
}
