import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Modelo de datos para el estado del animal
class AnimalState {
  final String animalId;
  final double weight;
  final String healthStatus; // Puede ser "Bueno", "Regular", "Malo"
  final String latestDiagnosis;
  final DateTime lastConsultation;
  final String lastVaccine;
  final DateTime lastVaccineDate;

  AnimalState({
    required this.animalId,
    required this.weight,
    required this.healthStatus,
    required this.latestDiagnosis,
    required this.lastConsultation,
    required this.lastVaccine,
    required this.lastVaccineDate,
  });
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Estado del Animal',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       home: AnimalStateScreen(),
//     );
//   }
// }

class AnimalStateScreen extends StatelessWidget {
  // Datos ficticios del estado actual del animal
  final AnimalState currentAnimalState = AnimalState(
    animalId: '123',
    weight: 12.5, // Peso en kg
    healthStatus: 'Bueno',
    latestDiagnosis: 'Infección Respiratoria',
    lastConsultation: DateTime(2023, 9, 1),
    lastVaccine: 'Vacuna contra la rabia',
    lastVaccineDate: DateTime(2023, 9, 1),
  );

  @override
  Widget build(BuildContext context) {
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
                _buildStatusHeader(currentAnimalState.healthStatus),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para mostrar el estado de salud del animal de manera visual
  Widget _buildStatusHeader(String healthStatus) {
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
