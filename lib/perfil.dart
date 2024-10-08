import 'package:flutter/material.dart';
import 'package:informacion_animal/editarperfil.dart';

// Modelo de datos para el perfil de usuario
class UserProfile {
  final String name;
  final String email;
  final String phoneNumber;
  final String profileImageUrl;
  final String address;
  final String birthDate;
  final String gender;
  final String role; // Nueva propiedad para el rol
  final Map<String, String> socialLinks;

  UserProfile({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profileImageUrl,
    required this.address,
    required this.birthDate,
    required this.gender,
    required this.role, // Asegúrate de incluirlo aquí
    required this.socialLinks,
  });
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil de Usuario Mejorado',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  // Datos ficticios del perfil del usuario
  final UserProfile userProfile = UserProfile(
    name: 'John Doe',
    email: 'john.doe@example.com',
    phoneNumber: '+1 234 567 890',
    profileImageUrl:
        'https://www.w3schools.com/howto/img_avatar.png', // Imagen de avatar de ejemplo
    address: '123 Calle Falsa, Ciudad de Prueba',
    birthDate: '15 de Marzo, 1990',
    gender: 'Masculino',
    role: 'Administrador Ganadero', // Asigna un rol aquí
    socialLinks: {
      'Facebook': 'https://facebook.com/johndoe',
      'Twitter': 'https://twitter.com/johndoe',
      'LinkedIn': 'https://linkedin.com/in/johndoe',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuario'),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Sección de imagen de perfil
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(userProfile.profileImageUrl),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.teal),
                      onPressed: () {
                        // Acción para cambiar la foto de perfil
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Botón para cambiar la imagen de perfil
            TextButton.icon(
              icon: Icon(Icons.camera_alt, color: Colors.teal),
              label: Text(
                'Cambiar foto de perfil',
                style: TextStyle(color: Colors.teal),
              ),
              onPressed: () {
                // Lógica para cambiar la foto de perfil
              },
            ),
            SizedBox(height: 24),

            // Sección de información básica
            _buildProfileDetail(
              icon: Icons.person,
              label: 'Nombre',
              value: userProfile.name,
            ),
            SizedBox(height: 16),
            _buildProfileDetail(
              icon: Icons.email,
              label: 'Correo Electrónico',
              value: userProfile.email,
            ),
            SizedBox(height: 16),
            _buildProfileDetail(
              icon: Icons.phone,
              label: 'Número de Teléfono',
              value: userProfile.phoneNumber,
            ),
            SizedBox(height: 16),
            _buildProfileDetail(
              icon: Icons.cake,
              label: 'Fecha de Nacimiento',
              value: userProfile.birthDate,
            ),
            SizedBox(height: 16),
            _buildProfileDetail(
              icon: Icons.male,
              label: 'Género',
              value: userProfile.gender,
            ),
            SizedBox(height: 16),
            _buildProfileDetail(
              icon: Icons.location_on,
              label: 'Dirección',
              value: userProfile.address,
            ),
            SizedBox(height: 16),
            _buildProfileDetail(
              icon: Icons.business,
              label: 'Rol',
              value: userProfile.role, // Mostrar el rol aquí
            ),
            SizedBox(height: 16),

            // Sección de redes sociales
            _buildSocialLinks(userProfile.socialLinks),

            SizedBox(height: 24),

            // Botón para editar el perfil
            ElevatedButton.icon(
              icon: Icon(Icons.edit),
              label: Text('Editar Perfil'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditUserProfileScreen(
                            userProfile: userProfile,
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper para construir una fila de detalles del perfil
  Widget _buildProfileDetail({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.teal),
        SizedBox(width: 16),
        Column(
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
      ],
    );
  }

  // Helper para construir la sección de enlaces a redes sociales
  Widget _buildSocialLinks(Map<String, String> socialLinks) {
    List<Widget> socialWidgets = socialLinks.entries.map((entry) {
      return ListTile(
        leading: Icon(Icons.link, color: Colors.teal),
        title: Text(entry.key),
        subtitle: Text(entry.value),
        onTap: () {
          // Aquí podrías implementar la lógica para abrir el enlace en un navegador
        },
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: socialWidgets,
    );
  }
}
