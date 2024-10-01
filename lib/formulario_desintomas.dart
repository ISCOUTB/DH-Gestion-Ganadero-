import 'package:flutter/material.dart';
import 'package:informacion_animal/gestion_errores.dart';
import 'package:informacion_animal/pagina_principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recomendaciones de Tratamiento con IA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SymptomForm(),
    );
  }
}

class SymptomForm extends StatefulWidget {
  @override
  _SymptomFormState createState() => _SymptomFormState();
}

class _SymptomFormState extends State<SymptomForm> {
  // Controladores para capturar los inputs
  final TextEditingController symptomController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController animalStatusController = TextEditingController();

  String treatmentRecommendation = 'Ninguna recomendación por el momento.';
  String warnings = 'Sin advertencias actuales.';

  // Función para simular el envío de datos y actualización de resultados
  void submitForm() {
    setState(() {
      treatmentRecommendation =
          'Tratamiento sugerido basado en los síntomas: ${symptomController.text}.';
      warnings = 'Advertencias para el estado: ${animalStatusController.text}.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recomendaciones de Tratamiento con IA'),
        actions: [
          TextButton(
            onPressed: () {
              // Navegar a la pantalla de recomendaciones con IA
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardScreen(),
                ),
              );
              // Aquí podrías agregar navegación u otras acciones
            },
            child: Text('Inicio',
                style:
                    TextStyle(color: const Color.fromARGB(255, 153, 143, 238))),
          ),
          TextButton(
            onPressed: () {
              // Navegar a la pantalla de recomendaciones con IA
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GestionErrores(),
                ),
              );
              // Aquí podrías agregar navegación u otras acciones
            },
            child: Text('Copia y Errores',
                style:
                    TextStyle(color: const Color.fromARGB(255, 153, 143, 238))),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Formulario de síntomas
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Formulario de síntomas',
                      style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  TextField(
                    controller: symptomController,
                    decoration: InputDecoration(
                      labelText: 'Síntomas principales',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: durationController,
                    decoration: InputDecoration(
                      labelText: 'Duración de síntomas (Horas transcurridas)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: animalStatusController,
                    decoration: InputDecoration(
                      labelText:
                          'Estado del animal (Grave, Requiere Atención, Normal)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: submitForm,
                    child: Text('Guardar y enviar'),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            // Resultados AI
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AI Resultados', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 20),
                  Text('Tratamiento Recomendado:',
                      style: TextStyle(fontSize: 16)),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text(treatmentRecommendation),
                  ),
                  SizedBox(height: 20),
                  Text('Advertencias y Aclaraciones',
                      style: TextStyle(fontSize: 16)),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text(warnings),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
