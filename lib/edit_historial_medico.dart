import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Historial Médico',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MedicalHistoryForm(),
    );
  }
}

class MedicalHistoryForm extends StatefulWidget {
  @override
  MedicalHistoryFormState createState() => MedicalHistoryFormState();
}

class MedicalHistoryFormState extends State<MedicalHistoryForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final _animalIdController = TextEditingController();
  final _diagnosisController = TextEditingController();
  final _treatmentController = TextEditingController();
  final _vaccineController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  DateTime? _nextConsultationDate;

  // Function to pick a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectNextConsultationDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _nextConsultationDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial Médico', style: TextStyle(fontSize: 22)),
        elevation: 5,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información del Paciente',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal),
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _animalIdController,
                      labelText: 'ID del Animal',
                      icon: Icons.pets,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese el ID del animal';
                        }
                        return null;
                      },
                    ),
                    _buildDatePicker(
                      context,
                      label: 'Fecha de Consulta',
                      selectedDate: _selectedDate,
                      onPressed: () => _selectDate(context),
                    ),
                    _buildTextField(
                      controller: _diagnosisController,
                      labelText: 'Diagnóstico',
                      icon: Icons.medical_services,
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese el diagnóstico';
                        }
                        if (value.length < 10) {
                          return 'La descripción debe tener al menos 10 caracteres';
                        }
                        return null;
                      },
                    ),
                    _buildTextField(
                      controller: _treatmentController,
                      labelText: 'Tratamiento',
                      icon: Icons.local_hospital,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese el tratamiento';
                        }
                        return null;
                      },
                    ),
                    _buildTextField(
                      controller: _vaccineController,
                      labelText: 'Vacunas Aplicadas (Opcional)',
                      icon: Icons.vaccines,
                    ),
                    _buildDatePicker(
                      context,
                      label: 'Próxima Consulta',
                      selectedDate: _nextConsultationDate,
                      onPressed: () => _selectNextConsultationDate(context),
                      optional: true,
                    ),
                    _buildTextField(
                      controller: _notesController,
                      labelText: 'Notas Adicionales (Opcional)',
                      icon: Icons.note_alt,
                      maxLines: 3,
                      maxLength: 250,
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(Icons.save),
                          label: Text('Guardar'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 24.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Historial guardado exitosamente'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
                        ),
                        ElevatedButton.icon(
                          icon: Icon(Icons.cancel),
                          label: Text('Cancelar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper to create text fields with icons
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    String? Function(String?)? validator,
    int maxLines = 1,
    int? maxLength,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon, color: Colors.teal),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        maxLines: maxLines,
        maxLength: maxLength,
        validator: validator,
      ),
    );
  }

  // Helper to create date pickers with icons
  Widget _buildDatePicker(BuildContext context,
      {required String label,
      required DateTime? selectedDate,
      required VoidCallback onPressed,
      bool optional = false}) {
    String displayText;

    // Eliminar la anidación del operador ternario
    if (selectedDate != null) {
      displayText = '$label: ${DateFormat.yMMMd().format(selectedDate)}';
    } else if (optional) {
      displayText = '$label: No seleccionada';
    } else {
      displayText = '$label: Seleccione una fecha';
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today,
            color: Colors.teal,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              displayText,
              style: TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.teal),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
