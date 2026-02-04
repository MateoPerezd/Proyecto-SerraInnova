import 'package:flutter/material.dart';
import '../models/inmueble.dart';
import '../widgets/form_template.dart';

class FichaInmueblePage extends StatelessWidget {
  const FichaInmueblePage({super.key});

  @override
  Widget build(BuildContext context) {
    final inmueble =
        ModalRoute.of(context)!.settings.arguments as Inmueble;

    return Scaffold(
      body: FormTemplate(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                            TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Volver'),
                ),

            const SizedBox(height: 12),
              // =========================
              // CABECERA
              // =========================
              const Text(
                'Ficha del inmueble',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2A7A),
                ),
              ),
              const SizedBox(height: 8),

              

              const SizedBox(height: 24),

              // =========================
              // SECCIONES
              // =========================
              _section(
                title: 'Identificación del propietario',
                children: [
                  _row('ID propietario', inmueble.propietarioId),
                ],
              ),

              _section(
                title: 'Datos principales del inmueble',
                children: [
                  _row('Tipo', inmueble.informacion.tipoInmueble),
                  _row('Oferta', inmueble.informacion.tipoOferta),
                  _row('Dirección', inmueble.informacion.direccion),
                  _row('Ciudad', inmueble.informacion.ciudad),
                  _row('Código postal',
                      inmueble.informacion.codigoPostal),
                  _row('Superficie',
                      '${inmueble.informacion.superficie} m²'),
                  _row('Habitaciones',
                      inmueble.informacion.habitaciones.toString()),
                  _row('Baños',
                      inmueble.informacion.banos.toString()),
                ],
              ),

              _section(
                title: 'Estado de conservación',
                children: [
                  _row('Estado', inmueble.informacion.estado),
                  if (inmueble.informacion.anioConstruccion != null)
                    _row(
                      'Año construcción',
                      inmueble.informacion.anioConstruccion.toString(),
                    ),
                ],
              ),

              _section(
                title: 'Grado de sostenibilidad',
                children: [
                  _row(
                    'Certificado energético',
                    inmueble.sostenibilidad.certificadoEnergetico ??
                        'No informado',
                  ),
                  _row(
                    'Consumo estimado',
                    inmueble.sostenibilidad.consumoEstimado ??
                        'No informado',
                  ),
                  _row(
                    'Energías renovables',
                    inmueble.sostenibilidad.energiasRenovables.isNotEmpty
                        ? 'Sí'
                        : 'No',
                  ),
                  _row(
                    'Materiales sostenibles',
                    inmueble.sostenibilidad.materialesSostenibles ??
                        'No',
                  ),
                ],
              ),

              _section(
                title: 'Nivel de adecuación social',
                children: [
                  _boolRow(
                    'Adaptado movilidad reducida',
                    inmueble.finalidadSocial
                        .adaptadoMovilidadReducida,
                  ),
                  _boolRow(
                    'Acepta colectivos vulnerables',
                    inmueble.finalidadSocial
                        .aceptaColectivosVulnerables,
                  ),
                  _boolRow(
                    'Permite mascotas',
                    inmueble.finalidadSocial.permiteMascotas,
                  ),
                ],
              ),

              _section(
                title: 'Documentación verificada',
                children: inmueble.documentacion.documentos.isEmpty
                    ? [_row('Estado', 'No aportada')]
                    : inmueble.documentacion.documentos
                        .map(
                          (d) => _row(
                            'Documento',
                            d.split('/').last,
                          ),
                        )
                        .toList(),
              ),

              

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // =========================
  // COMPONENTES AUXILIARES
  // =========================

  Widget _section({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
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
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _boolRow(String label, bool value) {
    return _row(label, value ? 'Sí' : 'No');
  }

  
}
