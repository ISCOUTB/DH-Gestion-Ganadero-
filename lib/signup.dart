import 'package:flutter/material.dart';
import 'localDB.dart';

class SignUpScreen extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(24),
                constraints: BoxConstraints(
                  maxWidth: 600,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _header(context),
                    const SizedBox(height: 20),
                    _inputFields(context),
                    const SizedBox(height: 20),
                    _loginInfo(context),
                    const SizedBox(height: 10),
                    _errors(context),
                  ],
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
          "Crea la cuenta",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Ingrese los datos para empezar"),
      ],
    );
  }

  _inputFields(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: "Nombre de usuario",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: "Correo",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.email_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: "Contraseña",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.key),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _confirmPasswordController,
          decoration: InputDecoration(
            hintText: "Confirmar contraseña",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.key),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () async {
            String username = _usernameController.text;
            String email = _emailController.text;
            String password = _passwordController.text;
            String confirmPassword = _confirmPasswordController.text;

            if (password != confirmPassword) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Error"),
                  content: const Text("Las contraseñas no coinciden"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
              return;
            }

            bool exists = await DatabaseHelper().userExists(username, email);
            if (exists) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Error"),
                  content: const Text("La cuenta ya existe con ese usuario o correo"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            } else {
              await DatabaseHelper().insertUser(username, email, password);
              Navigator.pushNamed(context, '/login');
            }
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "Crear",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  _loginInfo(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("¿Ya tienes una cuenta?"),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/login'),
          child: const Text("Ingresa"),
        ),
      ],
    );
  }

  _errors(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Ingresa a gestión de errores"),
        TextButton(
          onPressed: () => Navigator.pushNamed(context, '/gestion'),
          child: const Text("Errores"),
        ),
      ],
    );
  }
}
