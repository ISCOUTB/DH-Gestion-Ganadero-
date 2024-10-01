import 'package:flutter/material.dart';
import 'package:informacion_animal/agregar_animal.dart';
import 'package:informacion_animal/listas_de_usuarios.dart';
import 'package:informacion_animal/login.dart';
// import 'package:informacion_animal/CustomCard.dart';
import 'package:informacion_animal/notificaciones_vacuna.dart'; // Ensure this import is correct
import 'package:informacion_animal/animal_info_screen.dart'; // Asegúrate de que la ruta del import sea correcta

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey[300],
            flexibleSpace: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icono de usuario y menú desplegable
                  Row(
                    children: [
                      PopupMenuButton<int>(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30.0,
                          color: Colors.black,
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<int>>[
                          const PopupMenuItem<int>(
                            value: 1,
                            child: Text('Perfil'),
                          ),
                          const PopupMenuItem<int>(
                            value: 2,
                            child: Text('Cerrar sesión'),
                          ),
                          const PopupMenuItem<int>(
                            value: 3,
                            child: Text('Lista de usuarios'),
                          ),
                        ],
                        onSelected: (int value) {
                          switch (value) {
                            case 1:
                              // Navegar a la pantalla de perfil
                              break;
                            case 2:
                              // Manejar el cierre de sesión
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                              break;
                            case 3:
                              // Navegar a la pantalla de lista de usuarios
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListaUsuarios()),
                              );
                              break;
                          }
                        },
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        'Usuario',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  // Barra de búsqueda y notificaciones
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: PopupMenuButton<int>(
                              icon: const Icon(
                                Icons.menu,
                                size: 20.0,
                                color: Colors.black,
                              ),
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<int>>[
                                PopupMenuItem<int>(
                                  value: 1,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text('Opción 1'),
                                  ),
                                ),
                                const PopupMenuItem<int>(
                                  value: 2,
                                  child: Text('Opción 2'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 3,
                                  child: Text('Opción 3'),
                                ),
                              ],
                            ),
                            hintText: 'Buscar',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      PopupMenuButton<int>(
                        icon: const Icon(
                          Icons.notifications,
                          size: 30.0,
                          color: Colors.black,
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<int>>[
                          const PopupMenuItem<int>(
                            value: 1,
                            child: Text('Opción 1'),
                          ),
                          const PopupMenuItem<int>(
                            value: 2,
                            child: Text('Opción 2'),
                          ),
                          const PopupMenuItem<int>(
                            value: 3,
                            child: Text('Opción 3'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total animales: xxxx',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 5, // Número de columnas
                  crossAxisSpacing: 20.0, // Espacio entre columnas
                  mainAxisSpacing: 30.0, // Espacio entre filas
                  childAspectRatio: 1.2, // Relación de aspecto
                  children: [
                    CustomCard(
                      color: Colors.green[100]!,
                      icon: Icons.check_circle,
                      title: 'ID animal 1',
                      subtitle: 'Texto secundario',
                      iconBackgroundColor: Colors.green,
                      warningIcon: Icons.vaccines,
                      warningIconColor: Colors.green,
                      imageUrl:
                          'https://cdn.pixabay.com/photo/2016/10/04/23/52/cow-1715829_1280.jpg',
                      onTap: () {
                        // Accion al tocar toda la tarjeta
                      },
                      onTitleTap: () {
                        // Navegar a otra pantalla al tocar el título
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AnimalInfoScreen(
                                animalId: 1,
                                title: 'Animal Info',
                                imageUrl:
                                    'https://cdn.pixabay.com/photo/2016/10/04/23/52/cow-1715829_1280.jpg'),
                          ),
                        );
                      },
                    ),
                    CustomCard(
                      color: Colors.blue[100]!,
                      icon: Icons.check_circle,
                      title: 'ID animal 2',
                      subtitle: 'Texto secundario',
                      iconBackgroundColor: Colors.green,
                      warningIcon: Icons.vaccines,
                      warningIconColor: Colors.yellow,
                      imageUrl:
                          'https://images.unsplash.com/photo-1660613027300-d82f6471ea9d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FyYSUyMGRlJTIwdmFjYXxlbnwwfHwwfHx8MA%3D%3D',
                      onTap: () {
                        // Accion al tocar toda la tarjeta
                      },
                      onTitleTap: () {
                        // Navegar a otra pantalla al tocar el título
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AnimalInfoScreen(
                                animalId: 2,
                                title: 'Animal Info',
                                imageUrl:
                                    'https://images.unsplash.com/photo-1660613027300-d82f6471ea9d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FyYSUyMGRlJTIwdmFjYXxlbnwwfHwwfHx8MA%3D%3D'),
                          ),
                        );
                      },
                    ),
                    CustomCard(
                      color: Colors.purple[100]!,
                      icon: Icons.warning,
                      title: 'ID animal 3',
                      subtitle: 'Texto secundario',
                      iconBackgroundColor: Colors.red,
                      warningIcon: Icons.vaccines,
                      warningIconColor: Colors.red,
                      imageUrl:
                          'https://www.shutterstock.com/image-photo/close-cow-black-white-friendly-260nw-2341064189.jpg',
                      onTap: () {
                        // Accion al tocar toda la tarjeta
                      },
                      onTitleTap: () {
                        // Navegar a otra pantalla al tocar el título
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AnimalInfoScreen(
                                animalId: 3,
                                title: 'Animal Info',
                                imageUrl:
                                    'https://www.shutterstock.com/image-photo/close-cow-black-white-friendly-260nw-2341064189.jpg'),
                          ),
                        );
                      },
                    ),
                    CustomCard(
                      color: Colors.yellow[100]!,
                      icon: Icons.warning_amber,
                      title: 'ID animal 4',
                      subtitle: 'Texto secundario',
                      iconBackgroundColor: Colors.yellow,
                      warningIcon: Icons.vaccines,
                      warningIconColor: Colors.yellow,
                      imageUrl:
                          'https://st3.depositphotos.com/29384342/34178/i/450/depositphotos_341784154-stock-photo-cow-cows-cattle-pasture.jpg',
                      onTap: () {
                        // Accion al tocar toda la tarjeta
                      },
                      onTitleTap: () {
                        // Navegar a otra pantalla al tocar el título
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AnimalInfoScreen(
                                animalId: 4,
                                title: 'Animal Info',
                                imageUrl:
                                    'https://st3.depositphotos.com/29384342/34178/i/450/depositphotos_341784154-stock-photo-cow-cows-cattle-pasture.jpg'),
                          ),
                        );
                      },
                    ),
                    CustomCard(
                      color: Colors.red[100]!,
                      icon: Icons.warning,
                      title: 'ID animal 5',
                      subtitle: 'Texto secundario',
                      iconBackgroundColor: Colors.red,
                      warningIcon: Icons.vaccines,
                      warningIconColor: Colors.red,
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf6v_PsJBpClTa6zN212h8Igk5a-mEgB2iqaHbAnA04BDm1XusFG2LyAn2UvAq1XZYPmI&usqp=CAU',
                      onTap: () {
                        // Accion al tocar toda la tarjeta
                      },
                      onTitleTap: () {
                        // Navegar a otra pantalla al tocar el título
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AnimalInfoScreen(
                                animalId: 5,
                                title: 'Animal Info',
                                imageUrl:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf6v_PsJBpClTa6zN212h8Igk5a-mEgB2iqaHbAnA04BDm1XusFG2LyAn2UvAq1XZYPmI&usqp=CAU'),
                          ),
                        );
                      },
                    ),
                    // Botón de añadir
                    Center(
                      child: SizedBox(
                        width: 350,
                        height: 140,
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            Navigator.push(
                              // nos ayuda a navegar a otra pantalla, en este caso a la pantalla de GestionErrores
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnimalFormScreen()),
                            );
                            // Acción al hacer clic, "por agregar"
                          },
                          icon: const Icon(Icons.add, size: 50),
                          label: const Text('Añadir'),
                          backgroundColor: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconBackgroundColor;
  final IconData warningIcon;
  final Color warningIconColor;
  final String imageUrl;
  final VoidCallback onTap;
  final VoidCallback onTitleTap; // Nuevo callback para el título

  const CustomCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconBackgroundColor,
    required this.warningIcon,
    required this.warningIconColor,
    required this.imageUrl,
    required this.onTap,
    required this.onTitleTap, // Recibir el nuevo callback
  });

  String getWarningMessage(Color color) {
    if (color == Colors.green) {
      return 'Bueno';
    } else if (color == Colors.yellow) {
      return 'Cuidado';
    } else if (color == Colors.red) {
      return 'Peligro';
    }
    return 'Desconocido';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // // Acción al hacer clic en el ícono
                            // Navega a la pantalla de notificaciones al hacer clic en el ícono
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnimalStateScreen(
                                  animalId: '1234',
                                ), // La pantalla de destino
                              ),
                            );
                          }, // icono de advertencia de salud o estado del animal
                          child: Tooltip(
                            message: getWarningMessage(iconBackgroundColor),
                            child: CircleAvatar(
                              backgroundColor: iconBackgroundColor,
                              child: Icon(icon, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        GestureDetector(
                          // Nuevo GestureDetector para el ícono de advertencia de vacunas
                          onTap: () {
                            // // Acción al hacer clic en el ícono
                            // Navega a la pantalla de notificaciones al hacer clic en el ícono
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NotificationScreen(), // La pantalla de destino
                              ),
                            );
                          },
                          child: Tooltip(
                            // Nuevo Tooltip para el ícono de advertencia de vacunas para que muestre un mensaje pero a su vez se pueda hacer clic en el icono de advertencia y ir a la pantalla de notificaciones de vacunas
                            message: getWarningMessage(warningIconColor),
                            child: CircleAvatar(
                              backgroundColor: warningIconColor,
                              child: Icon(warningIcon, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    PopupMenuButton<String>(
                      onSelected: (String result) {
                        if (result == 'Editar') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AnimalFormScreen(), // Asegúrate de que esta pantalla exista
                            ),
                          );
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'Editar',
                          child: Text('Editar'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Borrar',
                          child: Text('Borrar'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Administrar',
                          child: Text('Administrar'),
                        ),
                      ],
                      icon: const Icon(Icons.menu),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: onTitleTap, // Callback para el título
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      // Text(
                      //   title,
                      //   style: const TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 16,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
