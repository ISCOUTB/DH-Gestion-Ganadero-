import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ListaUsuarios(),
//     );
//   }
// }

class ListaUsuarios extends StatefulWidget {
  @override
  _ListaUsuariosState createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  List<Map<String, String>> usuarios = [
    {'nombre': 'John Wick', 'rol': 'Administrator', 'id': '0.01'},
    {'nombre': 'Migue', 'rol': 'Ganadero', 'id': '0.02'},
    {'nombre': 'Jorge', 'rol': 'Ganadero', 'id': '0.03'},
  ];

  List<Map<String, String>> usuariosFiltrados = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usuariosFiltrados = usuarios;
  }

  void filtrarUsuarios(String query) {
    final usuariosFiltrados = usuarios.where((usuario) {
      final nombreLower = usuario['nombre']!.toLowerCase();
      final rolLower = usuario['rol']!.toLowerCase();
      final idLower = usuario['id']!.toLowerCase();
      final searchLower = query.toLowerCase();

      return nombreLower.contains(searchLower) ||
          rolLower.contains(searchLower) ||
          idLower.contains(searchLower);
    }).toList();

    setState(() {
      this.usuariosFiltrados = usuariosFiltrados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Usuarios"),
        actions: [
          TextButton(
            onPressed: () {
              // Acción para 'Copia y Errores'
            },
            child: Text(
              "Copia y Errores",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Buscar por nombre, rol o ID',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    filtrarUsuarios(searchController.text);
                  },
                ),
              ),
              onChanged: (query) {
                filtrarUsuarios(query);
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text('Nombre',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text('Rol',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text('ID',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(child: Container()), // Espacio para los botones
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: usuariosFiltrados.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Row(
                        children: [
                          Expanded(
                              child: Text(usuariosFiltrados[index]['nombre']!)),
                          Expanded(
                              child: Text(usuariosFiltrados[index]['rol']!)),
                          Expanded(
                              child: Text(usuariosFiltrados[index]['id']!)),
                          Expanded(
                            child: Wrap(
                              spacing: 12, // espacio entre botones
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Acción para 'Editar'
                                  },
                                  child: Text('Editar'),
                                ),
                                if (usuariosFiltrados[index]['rol'] !=
                                    'Administrator')
                                  ElevatedButton(
                                    onPressed: () {
                                      // Acción para 'Eliminar'
                                    },
                                    child: Text('Eliminar'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                if (usuariosFiltrados[index]['rol'] !=
                                    'Administrator')
                                  ElevatedButton(
                                    onPressed: () {
                                      // Acción para 'Asignar a administrador'
                                    },
                                    child: Text('Asignar a administrador'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          248, 193, 197, 186),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción para agregar usuario
              },
              child: Text("Agregar Usuario"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Acción para ir a página anterior
                  },
                  child: Text("Anterior"),
                ),
                Text("1 2 3"),
                TextButton(
                  onPressed: () {
                    // Acción para ir a página siguiente
                  },
                  child: Text("Siguiente"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
