import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'localDB.dart'; // Importa el archivo de la base de datos actualizado

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _header(context),
                      const SizedBox(height: 20),
                      _inputFields(context),
                      const SizedBox(height: 20),
                      _loginActions(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          'Iniciar Sesión',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text('Ingrese sus datos para continuar'),
      ],
    );
  }

  _inputFields(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: 'Nombre de usuario',
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, ingresa tu nombre de usuario';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: 'Contraseña',
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.key),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, ingresa tu contraseña';
            }
            return null;
          },
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              String username = _usernameController.text;
              String password = _passwordController.text;

              bool isValid = await DatabaseHelper().validateUser(username, password);
              if (isValid) {
                Navigator.pushNamed(context, '/principal');
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Error"),
                    content: const Text("Nombre de usuario o contraseña incorrectos"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              }
            }
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            'Iniciar sesión',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  _loginActions(context) {
    return Column(
      children: [
        const Text("¿No tienes una cuenta?"),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/signup'),
          child: const Text("Regístrate"),
        ),
      ],
    );
  }
}
