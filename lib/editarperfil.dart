import 'package:flutter/material.dart';
import 'package:informacion_animal/perfil.dart';

class EditUserProfileScreen extends StatefulWidget {
  final UserProfile userProfile;

  EditUserProfileScreen({required this.userProfile});

  @override
  _EditUserProfileScreenState createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  // Controladores para editar cada campo del perfil
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _addressController;
  late TextEditingController _birthDateController;
  late TextEditingController _genderController;
  late TextEditingController _roleController; // Controlador para el rol

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userProfile.name);
    _emailController = TextEditingController(text: widget.userProfile.email);
    _phoneNumberController =
        TextEditingController(text: widget.userProfile.phoneNumber);
    _addressController =
        TextEditingController(text: widget.userProfile.address);
    _birthDateController =
        TextEditingController(text: widget.userProfile.birthDate);
    _genderController = TextEditingController(text: widget.userProfile.gender);
    _roleController = TextEditingController(
        text: widget.userProfile.role); // Inicializa el controlador del rol
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _birthDateController.dispose();
    _genderController.dispose();
    _roleController.dispose(); // Deshazte del controlador del rol
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          NetworkImage(widget.userProfile.profileImageUrl),
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
              SizedBox(height: 24),
              _buildTextField(
                label: 'Nombre',
                controller: _nameController,
                icon: Icons.person,
              ),
              SizedBox(height: 16),
              _buildTextField(
                label: 'Correo Electrónico',
                controller: _emailController,
                icon: Icons.email,
              ),
              SizedBox(height: 16),
              _buildTextField(
                label: 'Número de Teléfono',
                controller: _phoneNumberController,
                icon: Icons.phone,
              ),
              SizedBox(height: 16),
              _buildTextField(
                label: 'Dirección',
                controller: _addressController,
                icon: Icons.location_on,
              ),
              SizedBox(height: 16),
              _buildTextField(
                label: 'Fecha de Nacimiento',
                controller: _birthDateController,
                icon: Icons.cake,
              ),
              SizedBox(height: 16),
              _buildTextField(
                label: 'Género',
                controller: _genderController,
                icon: Icons.male,
              ),
              SizedBox(height: 16),
              _buildTextField(
                label: 'Rol', // Nuevo campo para el rol
                controller: _roleController,
                icon: Icons.assignment_ind,
              ),
              SizedBox(height: 24),
              // Botón para guardar los cambios
              Center(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  label: Text('Guardar Cambios'),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Lógica para guardar los cambios del perfil
                    // Actualizar la información en el backend o la base de datos
                    Navigator.pop(context); // Regresa a la pantalla de perfil
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper para crear campos de texto editables
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.teal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
