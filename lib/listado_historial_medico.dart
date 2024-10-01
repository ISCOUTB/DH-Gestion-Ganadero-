import 'package:flutter/material.dart';
import 'package:informacion_animal/edit_historial_medico.dart';

import 'package:intl/intl.dart';

// Modelo de datos para el historial médico
class MedicalRecord {
  final String animalId;
  final String diagnosis;
  final String treatment;
  final String vaccine;
  final DateTime consultationDate;
  final DateTime? nextConsultationDate;
  final String notes;

  MedicalRecord({
    required this.animalId,
    required this.diagnosis,
    required this.treatment,
    required this.vaccine,
    required this.consultationDate,
    this.nextConsultationDate,
    required this.notes,
  });
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Historial Médico Animal',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MedicalHistoryListScreen(),
    );
  }
}

class MedicalHistoryListScreen extends StatelessWidget {
  // Datos ficticios para la lista de historial médico
  final List<MedicalRecord> medicalHistoryList = [
    MedicalRecord(
      animalId: '123',
      diagnosis: 'Infección Respiratoria',
      treatment: 'Antibióticos durante 7 días',
      vaccine: 'Vacuna contra la rabia',
      consultationDate: DateTime(2023, 9, 1),
      nextConsultationDate: DateTime(2024, 9, 1),
      notes: 'El animal respondió bien al tratamiento.',
    ),
    MedicalRecord(
      animalId: '123',
      diagnosis: 'Fractura en la pata trasera',
      treatment: 'Inmovilización y analgésicos',
      vaccine: 'Vacuna contra el moquillo',
      consultationDate: DateTime(2022, 12, 15),
      nextConsultationDate: DateTime(2023, 1, 15),
      notes: 'El animal necesitó reposo durante 3 semanas.',
    ),
    // Puedes agregar más registros aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial Médico'),
        centerTitle: true,
        elevation: 5,
      ),
      body: ListView.builder(
        itemCount: medicalHistoryList.length,
        itemBuilder: (context, index) {
          final record = medicalHistoryList[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.local_hospital, color: Colors.teal),
                  title: Text(
                    '${record.diagnosis}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Fecha: ${DateFormat.yMMMd().format(record.consultationDate)}',
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Navegar a la página de detalles
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MedicalRecordDetailScreen(medicalRecord: record),
                      ),
                    );
                  },
                ),
                // SizedBox(height: 10),
                // ElevatedButton(
                //   onPressed: () {
                //     // Lógica para editar el registro
                //   },
                //   child: Text('Editar'),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Pantalla de detalles del historial médico
class MedicalRecordDetailScreen extends StatelessWidget {
  final MedicalRecord medicalRecord;

  MedicalRecordDetailScreen({required this.medicalRecord});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Historial Médico'),
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
                _buildDetailRow(
                  icon: Icons.pets,
                  label: 'ID del Animal',
                  value: medicalRecord.animalId,
                ),
                SizedBox(height: 16),
                _buildDetailRow(
                  icon: Icons.medical_services,
                  label: 'Diagnóstico',
                  value: medicalRecord.diagnosis,
                ),
                SizedBox(height: 16),
                _buildDetailRow(
                  icon: Icons.local_hospital,
                  label: 'Tratamiento',
                  value: medicalRecord.treatment,
                ),
                SizedBox(height: 16),
                _buildDetailRow(
                  icon: Icons.vaccines,
                  label: 'Vacuna',
                  value: medicalRecord.vaccine.isEmpty
                      ? 'No aplicada'
                      : medicalRecord.vaccine,
                ),
                SizedBox(height: 16),
                _buildDetailRow(
                  icon: Icons.calendar_today,
                  label: 'Fecha de Consulta',
                  value:
                      DateFormat.yMMMd().format(medicalRecord.consultationDate),
                ),
                SizedBox(height: 16),
                if (medicalRecord.nextConsultationDate != null)
                  _buildDetailRow(
                    icon: Icons.calendar_today_outlined,
                    label: 'Próxima Consulta',
                    value: DateFormat.yMMMd()
                        .format(medicalRecord.nextConsultationDate!),
                  ),
                SizedBox(height: 16),
                _buildDetailRow(
                  icon: Icons.note_alt,
                  label: 'Notas Adicionales',
                  value: medicalRecord.notes.isEmpty
                      ? 'Sin notas adicionales'
                      : medicalRecord.notes,
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.check_circle),
                      label: Text('Volver a la lista'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 24.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    ElevatedButton.icon(
                      icon: Icon(Icons.edit),
                      label: Text('Editar'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 24.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Acción para retroceder a la pantalla anterior
                        Navigator.push(
                          // nos ayuda a navegar a otra pantalla
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedicalHistoryForm()),
                        );
                      },
                    ),
                  ],
                ),
                // SizedBox(height: 24),
                // ElevatedButton.icon(
                //   icon: Icon(Icons.check_circle),
                //   label: Text('Volver a la lista'),
                //   style: ElevatedButton.styleFrom(
                //     padding:
                //         EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                // ),
                // ElevatedButton.icon(
                //   icon: Icon(Icons.edit),
                //   label: Text('Editar'),
                //   style: ElevatedButton.styleFrom(
                //     padding:
                //         EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   onPressed: () {
                //     // Lógica para editar el registro
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
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
