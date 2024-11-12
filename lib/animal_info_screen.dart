import 'package:flutter/material.dart';
import 'package:informacion_animal/estado_animal.dart';
import 'package:informacion_animal/formulario_desintomas.dart';
import 'package:informacion_animal/gestion_errores.dart';
import 'package:informacion_animal/listado_historial_medico.dart';
import 'package:intl/intl.dart';

class AnimalStateScreen extends StatelessWidget {
  final String animalId;

  AnimalStateScreen({required this.animalId});

  @override
  Widget build(BuildContext context) {
    // Aquí puedes usar el animalId para obtener los datos del animal
    // Por ejemplo, podrías buscar en una lista de animales o hacer una llamada a una API

    // Datos ficticios del estado actual del animal
    final AnimalState currentAnimalState = AnimalState(
      animalId: animalId,
      weight: 12.5, // Peso en kg
      healthStatus: 'Bueno',
      latestDiagnosis: 'Infección Respiratoria',
      lastConsultation: DateTime(2023, 9, 1),
      lastVaccine: 'Vacuna contra la rabia',
      lastVaccineDate: DateTime(2023, 9, 1),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Estado Actual del Animal'),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildStatusHeader(currentAnimalState.healthStatus),
                SizedBox(height: 24),
                _buildDetailRow(
                  icon: Icons.pets,
                  label: 'ID del Animal',
                  value: currentAnimalState.animalId,
                ),
                SizedBox(height: 16),
                _buildDetailRow(
                  icon: Icons.monitor_weight,
                  label: 'Peso',
                  value: '${currentAnimalState.weight} kg',
                ),
                SizedBox(height: 16),
                _buildDetailRow(
                  icon: Icons.medical_services,
                  label: 'Último Diagnóstico',
                  value: currentAnimalState.latestDiagnosis,
                ),
                SizedBox(height: 16),
                _buildDetailRow(
                  icon: Icons.calendar_today,
                  label: 'Última Consulta',
                  value: DateFormat.yMMMd()
                      .format(currentAnimalState.lastConsultation),
                ),
                SizedBox(height: 16),
                _buildDetailRow(
                  icon: Icons.vaccines,
                  label: 'Última Vacuna',
                  value:
                      '${currentAnimalState.lastVaccine} (${DateFormat.yMMMd().format(currentAnimalState.lastVaccineDate)})',
                ),
                SizedBox(height: 32),
                Center(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.lightbulb),
                    label: Text('Ver Recomendaciones IA'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 24.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Navegar a la pantalla de recomendaciones con IA
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SymptomForm(),
                          // AIRecommendationsScreen(
                          //     animalState: currentAnimalState)
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para mostrar el estado de salud del animal de manera visual
  Widget buildStatusHeader(String healthStatus) {
    Color statusColor;
    IconData statusIcon;

    switch (healthStatus) {
      case 'Bueno':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'Regular':
        statusColor = Colors.orange;
        statusIcon = Icons.warning;
        break;
      case 'Malo':
        statusColor = Colors.red;
        statusIcon = Icons.error;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.help;
    }

    return Row(
      children: [
        Icon(statusIcon, color: statusColor, size: 40),
        SizedBox(width: 16),
        Text(
          'Estado de Salud: $healthStatus',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: statusColor,
          ),
        ),
      ],
    );
  }

  // Helper para construir una fila de detalles
  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.teal),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Pantalla de recomendaciones con IA
class AIRecommendationsScreen extends StatelessWidget {
  final AnimalState animalState;

  AIRecommendationsScreen({required this.animalState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recomendaciones con IA'),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recomendaciones Personalizadas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Basado en el estado actual del animal (ID: ${animalState.animalId}), te recomendamos lo siguiente:',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                _buildRecommendation(
                  'Peso saludable',
                  'El peso de tu mascota (${animalState.weight} kg) es adecuado. Mantén una dieta balanceada.',
                ),
                _buildRecommendation(
                  'Vacunación',
                  'La última vacuna fue ${animalState.lastVaccine}. Se recomienda seguir el calendario de vacunación.',
                ),
                _buildRecommendation(
                  'Chequeo regular',
                  'El diagnóstico más reciente fue "${animalState.latestDiagnosis}". Se recomienda programar un chequeo en 6 meses.',
                ),
                // Puedes agregar más recomendaciones según el estado del animal
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper para construir una recomendación
  Widget _buildRecommendation(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.lightbulb, color: Colors.teal),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimalInfoScreen extends StatelessWidget {
  final int animalId; // ID del animal
  final String title; // Título para el AppBar
  final String imageUrl; // URL de la imagen

  const AnimalInfoScreen({
    super.key,
    required this.animalId,
    required this.title,
    required this.imageUrl, // Acepta la URL de la imagen
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Regresar a la pantalla anterior
            },
            child: const Text("Inicio", style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              // Acción para retroceder a la pantalla anterior
              Navigator.push(
                // nos ayuda a navegar a otra pantalla, en este caso a la pantalla de GestionErrores
                context,
                MaterialPageRoute(builder: (context) => const GestionErrores()),
              );
            },
            child: const Text("Errores y copias",
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    imageUrl, // Usa la URL de la imagen
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text("Animal ID: $animalId",
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              const Text("Sexo"),
              TextFormField(),
              const SizedBox(height: 10),
              const Text("Fecha de Nacimiento"),
              TextFormField(),
              const SizedBox(height: 10),
              const Text("Raza"),
              TextFormField(),
              const SizedBox(height: 20),
              const Text(
                "Historial Médico",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción para retroceder a la pantalla anterior
                  Navigator.push(
                    // nos ayuda a navegar a otra pantalla, en este caso a la pantalla de GestionErrores
                    context,
                    MaterialPageRoute(
                        builder: (context) => MedicalHistoryListScreen()),
                  );
                },
                child: const Text("Ver Historial Médico"),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    title: Text("Evento 1"),
                  ),
                  ListTile(
                    title: Text("Evento 2"),
                  ),
                  ListTile(
                    title: Text("Evento 3"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica para editar
                      },
                      child: const Text("Editar"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        // Lógica para borrar
                      },
                      child: const Text("Borrar"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
