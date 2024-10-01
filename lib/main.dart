import 'package:flutter/material.dart';
import 'package:informacion_animal/gestion_errores.dart';
import 'package:informacion_animal/login.dart';
import 'package:informacion_animal/notificaciones_vacuna.dart';
import 'package:informacion_animal/pagina_principal.dart';
import 'package:informacion_animal/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.blueGrey,
        ),
        home: LoginPage(),
        routes: <String, WidgetBuilder>{
          '/login': (context) => LoginPage(),
          '/signup': (context) => const SignUpScreen(),
          '/gestion': (context) => const GestionErrores(),
          '/principal': (context) => const DashboardScreen(),
          '/vacunasnotificaciones': (context) => NotificationScreen(),
        });
  }
}
