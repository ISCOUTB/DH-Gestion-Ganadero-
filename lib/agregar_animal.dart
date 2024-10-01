import 'package:flutter/material.dart';
import 'dart:math';

class AnimalFormScreen extends StatefulWidget {
  @override
  _AnimalFormScreenState createState() => _AnimalFormScreenState();
}

class _AnimalFormScreenState extends State<AnimalFormScreen> {
  String? selectedYesNo;
  String? selectedVaccination;
  String? selectedMotherId;
  String gender = 'Macho';
  TextEditingController breedController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController animalStatusController = TextEditingController();
  String animalId = '';

  @override
  void initState() {
    super.initState();
    animalId =
        _generateAnimalId(); // Generate a random animal ID when the form is initialized
  }

  String _generateAnimalId() {
    // Simulate generating a random animal ID
    var random = Random();
    return 'AN${random.nextInt(10000)}'; // Example ID format: AN1234
  }

  void _clearForm() {
    setState(() {
      breedController.clear();
      weightController.clear();
      birthDateController.clear();
      animalStatusController.clear();
      selectedYesNo = null;
      selectedVaccination = null;
      selectedMotherId = null;
      gender = 'Macho';
    });
  }

  void _saveForm() {
    // Lógica para guardar el formulario
    // ...

    // Mostrar mensaje de éxito
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Éxito'),
          content: Text('El formulario ha sido guardado.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
                Navigator.of(context).pop(); // Regresar al menú principal
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _deleteAnimal() {
    // Lógica para eliminar el animal
    // ...

    // Mostrar mensaje de confirmación
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmación'),
          content: Text('El animal ha sido eliminado.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
                Navigator.of(context).pop(); // Regresar al menú principal
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID del animal: $animalId'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Left Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Breed input
                        Text('Raza'),
                        TextField(
                          controller: breedController,
                          decoration:
                              InputDecoration(hintText: 'Agregar texto'),
                        ),
                        SizedBox(height: 16),

                        // Weight input
                        Text('Peso'),
                        TextField(
                          controller: weightController,
                          decoration:
                              InputDecoration(hintText: 'Agregar texto'),
                        ),
                        SizedBox(height: 16),

                        // Gender selection
                        Text('Sexo'),
                        Row(
                          children: [
                            Radio(
                              value: 'Macho',
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                });
                              },
                            ),
                            Text('Macho'),
                            Radio(
                              value: 'Hembra',
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                });
                              },
                            ),
                            Text('Hembra'),
                          ],
                        ),
                        SizedBox(height: 16),

                        // Birth Date input
                        Text('Fecha de nacimiento'),
                        TextField(
                          controller: birthDateController,
                          decoration:
                              InputDecoration(hintText: 'Agregar texto'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),

                  // Right Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Is it a young animal?
                        Text('¿Es cría?'),
                        DropdownButton<String>(
                          value: selectedYesNo,
                          items: ['Sí', 'No']
                              .map((label) => DropdownMenuItem(
                                    child: Text(label),
                                    value: label,
                                  ))
                              .toList(),
                          hint: Text('Selecciona Sí o No'),
                          onChanged: (value) {
                            setState(() {
                              selectedYesNo = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),

                        // Mother's ID selection
                        Text('ID de la madre'),
                        DropdownButton<String>(
                          value: selectedMotherId,
                          items: ['ID 1', 'ID 2', 'No aplica']
                              .map((label) => DropdownMenuItem(
                                    child: Text(label),
                                    value: label,
                                  ))
                              .toList(),
                          hint: Text('Selecciona ID de la madre'),
                          onChanged: (value) {
                            setState(() {
                              selectedMotherId = value;
                            });
                          },
                        ),
                        SizedBox(height: 16),

                        // Animal state
                        Text('Estado del animal'),
                        TextField(
                          controller: animalStatusController,
                          decoration:
                              InputDecoration(hintText: 'Agregar texto'),
                        ),
                        SizedBox(height: 16),

                        // Vaccination applied
                        Text('¿Se le ha aplicado alguna vacuna?'),
                        DropdownButton<String>(
                          value: selectedVaccination,
                          items: ['Sí', 'No']
                              .map((label) => DropdownMenuItem(
                                    child: Text(label),
                                    value: label,
                                  ))
                              .toList(),
                          hint: Text('Selecciona Sí o No'),
                          onChanged: (value) {
                            setState(() {
                              selectedVaccination = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Add animal image (this spans the two columns)
              Text('Ingrese una foto del animal'),
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[300],
                child: Icon(Icons.add_a_photo),
              ),

              SizedBox(height: 16),

              // Buttons for saving and deleting
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _saveForm,
                    child: Text('Finalizar y Guardar'),
                  ),
                  ElevatedButton(
                    onPressed: _deleteAnimal,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Red color for delete
                    ),
                    child: Text('Eliminar'),
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
