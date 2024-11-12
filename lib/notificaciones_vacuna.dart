import 'package:flutter/material.dart';
import 'package:informacion_animal/agregar_vacuna.dart';
import 'package:informacion_animal/gestion_errores.dart';
import 'package:informacion_animal/pagina_principal.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  MyButtonState createState() => MyButtonState();
}

class MyButtonState extends State<MyButton> {
  Color _buttonColor = Colors.blue;

  void _changeColor() {
    setState(() {
      _buttonColor = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _changeColor,
      style: ElevatedButton.styleFrom(backgroundColor: _buttonColor),
      child: const Text('Completado', style: TextStyle(fontSize: 12)),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'idAnimal': 'id Animal 1',
      'tipoVacuna': 'Tipo de Vacuna 1',
      'fechaVencimiento': 'Fecha de Vencimiento 1'
    },
    {
      'idAnimal': 'id Animal 2',
      'tipoVacuna': 'Tipo de Vacuna 2',
      'fechaVencimiento': 'Fecha de Vencimiento 2'
    },
    {
      'idAnimal': 'id Animal 3',
      'tipoVacuna': 'Tipo de Vacuna 3',
      'fechaVencimiento': 'Fecha de Vencimiento 3'
    },
  ];

  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones de Vacunación'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardScreen()),
                );
              },
              child: const Text('Inicio', style: TextStyle(color: Colors.white)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GestionErrores()),
                );
              },
              child: const Text('Errores', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade700,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  'Alerta: Hay notificaciones pendientes, vencidas o próximas.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar por id, tipo de vacuna o fecha',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Buscar', style: TextStyle(fontSize: 12)),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VaccineNotificationForm()),
                      );
                    },
                    child: const Text('Agregar', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              ListView.builder(
                shrinkWrap: true, // Para ajustar el tamaño
                physics: const NeverScrollableScrollPhysics(),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      isThreeLine: true,
                      title: Text(
                        notifications[index]['idAnimal']!,
                        style: const TextStyle(fontSize: 14),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tipo de Vacuna: ${notifications[index]['tipoVacuna']}',
                              style: const TextStyle(fontSize: 12)),
                          Text('Fecha de Vencimiento: ${notifications[index]['fechaVencimiento']}',
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const MyButton(),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Reprog.', style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

