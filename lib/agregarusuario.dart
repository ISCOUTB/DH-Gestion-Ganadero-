import 'package:flutter/material.dart';

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  // Controladores para los campos de entrada
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  Map<String, String> _socialLinks = {};

  // Nueva variable para el rol seleccionado
  String? _selectedRole;
  final List<String> _roles = ['Administrador', ' Administrador Ganadero'];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _birthDateController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Nuevo Usuario'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo para el nombre
              _buildTextField(
                label: 'Nombre',
                controller: _nameController,
                icon: Icons.person,
              ),
              SizedBox(height: 16),

              // Campo para el correo electrónico
              _buildTextField(
                label: 'Correo Electrónico',
                controller: _emailController,
                icon: Icons.email,
              ),
              SizedBox(height: 16),

              // Campo para el número de teléfono
              _buildTextField(
                label: 'Número de Teléfono',
                controller: _phoneNumberController,
                icon: Icons.phone,
              ),
              SizedBox(height: 16),

              // Campo para la dirección
              _buildTextField(
                label: 'Dirección',
                controller: _addressController,
                icon: Icons.location_on,
              ),
              SizedBox(height: 16),

              // Campo para la fecha de nacimiento
              _buildTextField(
                label: 'Fecha de Nacimiento',
                controller: _birthDateController,
                icon: Icons.cake,
              ),
              SizedBox(height: 16),

              // Campo para el género
              _buildTextField(
                label: 'Género',
                controller: _genderController,
                icon: Icons.male,
              ),
              SizedBox(height: 16),

              // Dropdown para seleccionar el rol
              _buildRoleDropdown(),
              SizedBox(height: 24),

              // Botón para agregar el nuevo usuario
              Center(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('Agregar Usuario'),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Lógica para agregar el usuario
                    String name = _nameController.text;
                    String email = _emailController.text;
                    String phone = _phoneNumberController.text;
                    String address = _addressController.text;
                    String birthDate = _birthDateController.text;
                    String gender = _genderController.text;
                    String? role = _selectedRole;

                    if (role == null) {
                      // Mostrar un mensaje de error si no se selecciona un rol
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Por favor, seleccione un rol.')));
                      return;
                    }

                    // Aquí puedes agregar la lógica para guardar el usuario en una base de datos o lista
                    print("Nuevo usuario: $name, $email, $phone, Rol: $role");

                    // Limpiar los campos después de agregar el usuario
                    _clearFields();
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

  // Dropdown para seleccionar el rol del usuario
  Widget _buildRoleDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedRole,
      hint: Text('Seleccionar Rol'),
      decoration: InputDecoration(
        labelText: 'Rol',
        prefixIcon: Icon(Icons.security, color: Colors.teal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: _roles.map((String role) {
        return DropdownMenuItem<String>(
          value: role,
          child: Text(role),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedRole = newValue;
        });
      },
    );
  }

  // Función para limpiar los campos después de agregar un usuario
  void _clearFields() {
    _nameController.clear();
    _emailController.clear();
    _phoneNumberController.clear();
    _addressController.clear();
    _birthDateController.clear();
    _genderController.clear();
    _selectedRole = null;
  }
}
