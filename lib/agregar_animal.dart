import 'package:flutter/material.dart';
import 'dart:math';
import 'package:informacion_animal/localDB.dart';
import 'package:informacion_animal/animal_model.dart';

class AnimalFormScreen extends StatefulWidget {
  @override
  AnimalFormScreenState createState() => AnimalFormScreenState();
}

class AnimalFormScreenState extends State<AnimalFormScreen> {
  static const String _hintText = 'Agregar texto'; // Constante para el texto repetido

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

  void _saveForm() async {
    final animal = Animal(
      id: animalId,
      breed: breedController.text,
      gender: gender,
      weight: double.tryParse(weightController.text) ?? 0.0,
      birthDate: birthDateController.text,
      isYoung: selectedYesNo == 'Sí',
      motherId: selectedMotherId ?? 'No aplica',
      status: animalStatusController.text,
      vaccinated: selectedVaccination == 'Sí',
    );

    await DatabaseHelper().insertAnimal(animal);

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
                Navigator.of(context).pop();
                Navigator.of(context).pop();
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content: const Text('El animal ha sido eliminado.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
                Navigator.of(context).pop(); // Regresar al menú principal
              },
              child: const Text('OK'),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Raza'),
                TextField(
                  controller: breedController,
                  decoration: const InputDecoration(hintText: _hintText),
                ),
                const SizedBox(height: 16),
                const Text('Peso'),
                TextField(
                  controller: weightController,
                  decoration: const InputDecoration(hintText: _hintText),
                ),
                const SizedBox(height: 16),
                const Text('Sexo'),
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
                    const Text('Macho'),
                    Radio(
                      value: 'Hembra',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    const Text('Hembra'),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Fecha de nacimiento'),
                TextField(
                  controller: birthDateController,
                  decoration: const InputDecoration(hintText: _hintText),
                ),
                const SizedBox(height: 16),
                const Text('¿Es cría?'),
                DropdownButton<String>(
                  value: selectedYesNo,
                  items: ['Sí', 'No']
                      .map((label) => DropdownMenuItem(
                    value: label,
                    child: Text(label),
                  ))
                      .toList(),
                  hint: const Text('Selecciona Sí o No'),
                  onChanged: (value) {
                    setState(() {
                      selectedYesNo = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text('ID de la madre'),
                DropdownButton<String>(
                  value: selectedMotherId,
                  items: ['ID 1', 'ID 2', 'No aplica']
                      .map((label) => DropdownMenuItem(
                    value: label,
                    child: Text(label),
                  ))
                      .toList(),
                  hint: const Text('Selecciona ID de la madre'),
                  onChanged: (value) {
                    setState(() {
                      selectedMotherId = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text('Estado del animal'),
                TextField(
                  controller: animalStatusController,
                  decoration: const InputDecoration(hintText: _hintText),
                ),
                const SizedBox(height: 16),
                const Text('¿Se le ha aplicado alguna vacuna?'),
                DropdownButton<String>(
                  value: selectedVaccination,
                  items: ['Sí', 'No']
                      .map((label) => DropdownMenuItem(
                    value: label,
                    child: Text(label),
                  ))
                      .toList(),
                  hint: const Text('Selecciona Sí o No'),
                  onChanged: (value) {
                    setState(() {
                      selectedVaccination = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const Text('Ingrese una foto del animal'),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2, // Tamaño dinámico
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(Icons.add_a_photo),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _saveForm,
                      child: const Text('Finalizar y Guardar'),
                    ),
                    ElevatedButton(
                      onPressed: _deleteAnimal,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Botón rojo para eliminar
                      ),
                      child: const Text('Eliminar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
