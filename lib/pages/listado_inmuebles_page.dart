import 'package:flutter/material.dart';
import '../models/inmueble.dart';
import '../services/inmueble_services.dart';
import '../routes/app_routes.dart';
import '../widgets/form_template.dart';

class ListadoInmueblesPage extends StatefulWidget {
  const ListadoInmueblesPage({super.key});

  @override
  State<ListadoInmueblesPage> createState() => _ListadoInmueblesPageState();
}

class _ListadoInmueblesPageState extends State<ListadoInmueblesPage> {
  final InmuebleService _service = InmuebleService();
  late Future<List<Inmueble>> _future;

  @override
  void initState() {
    super.initState();
     _future = _service.getAllInmuebles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormTemplate(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Volver'),
          ),

  const SizedBox(height: 12),
            const Text(
              'Inmuebles registrados',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2A7A),
              ),
            ),
            const SizedBox(height: 24),

            FutureBuilder<List<Inmueble>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No hay inmuebles registrados.');
                }

                return Column(
                  children: snapshot.data!.map((inmueble) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        title: Text(
                          inmueble.informacion.direccion,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          inmueble.informacion.ciudad,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.fichaInmueble,
                            arguments: inmueble,
                          );
                        },
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
