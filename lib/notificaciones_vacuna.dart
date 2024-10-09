import 'package:flutter/material.dart';
import 'package:informacion_animal/agregar_vacuna.dart';
import 'package:informacion_animal/gestion_errores.dart';
import 'package:informacion_animal/pagina_principal.dart';

// class VaccineNotificationApp extends StatelessWidget {
// //no es necesario porque es una creacion de nueva pantalla osae app nueva y despues para retroceder no se iba a poder con la otra app osea pantalla anterior

// @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Notificaciones de Vacunación',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: NotificationScreen(),
//     );
//   }
// }

class MyButton extends StatefulWidget {
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
      child: Text('Marcar como completado'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaciones de Vacunación'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              // nos ayuda a navegar a otra pantalla, en este caso a la pantalla de GestionErrores
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  // nos ayuda a navegar a otra pantalla, en este caso a la pantalla de GestionErrores
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen()),
                );
              },
              child: Text('inicio', style: TextStyle(color: Colors.white)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              onPressed: () {
                // Acción para retroceder a la pantalla anterior
                Navigator.push(
                  // nos ayuda a navegar a otra pantalla, en este caso a la pantalla de GestionErrores
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GestionErrores()),
                );
              },
              child: Text('Errores y Copias',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.yellow.shade700,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'Alerta visual: Hay notificaciones pendientes, vencidas o próximas.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText:
                          'Buscar por id de animal, tipo de vacuna o fecha de vencimiento',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Buscar'),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Acción para retroceder a la pantalla anterior
                        Navigator.push(
                          // nos ayuda a navegar a otra pantalla, en este caso a la pantalla de GestionErrores
                          context,
                          MaterialPageRoute(
                              builder: (context) => VaccineNotificationForm()),
                        );
                      },
                      child: Text('Agregar Vacuna'),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(notifications[index]['idAnimal']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Tipo de Vacuna: ${notifications[index]['tipoVacuna']}'),
                          Text(
                              'Fecha de Vencimiento: ${notifications[index]['fechaVencimiento']}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   // child: Text('Marcar como completado'),
                          // ),
                          SizedBox(height: 20),
                          MyButton(), //boton de color que cambia al presionarlo como completado
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Reprogramar'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
