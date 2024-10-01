import 'package:flutter/material.dart';
import 'package:informacion_animal/gestion_errores.dart';
import 'package:informacion_animal/notificaciones_vacuna.dart';
import 'package:informacion_animal/pagina_principal.dart';

class VaccineNotificationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Acción para retroceder a la pantalla anterior
              Navigator.push(
                // nos ayuda a navegar a otra pantalla, en este caso a la pantalla de GestionErrores
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
          title: const Text(""),
          actions: [
            TextButton(
              onPressed: () {
                // Navegar a la pantalla de recomendaciones con IA
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                );
              },
              child: const Text(
                "Inicio",
                style: TextStyle(color: Color.fromARGB(255, 124, 124, 124)),
              ),
            ),
            TextButton(
              onPressed: () {
                // Acción para retroceder a la pantalla anterior
                Navigator.push(
                  // nos ayuda a navegar a otra pantalla, en este caso a la pantalla de GestionErrores
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GestionErrores()),
                );
                // Navegar a "Errores y Copias"
              },
              child: const Text(
                "Errores y Copias",
                style: TextStyle(color: Color.fromARGB(255, 124, 124, 124)),
              ),
            ),
          ],
        ),
        body: VaccineFormBody(),
      ),
    );
  }
}

class VaccineFormBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Notificación de Vacuna agregar',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fecha',
                  style: TextStyle(fontSize: 18),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Seleccionar fecha',
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la fecha';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Tipo o Descripción de Vacuna',
                  style: TextStyle(fontSize: 18),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Texto.....',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese una descripción';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Animal ID',
                  style: TextStyle(fontSize: 18),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Animal id',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el ID del animal';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Muestra mensaje de guardado exitoso
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('¡Guardado correctamente!'),
                            ),
                          );
                        }
                      },
                      child: const Text('Guardar'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // Muestra mensaje de cancelación
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Acción cancelada'),
                          ),
                        );
                      },
                      child: const Text('Cancelar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
