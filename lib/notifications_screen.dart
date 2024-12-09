import 'package:flutter/material.dart';
import 'package:menu_lateral/navbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notificaciones',
          style: TextStyle(
            color: Colors.white, // Color del texto de la AppBar
            fontWeight: FontWeight.bold, // Negrita para destacar el texto
          ),
        ),
        backgroundColor: Colors.red, // Color de fondo de la AppBar
      ),
      body: const Center(
        child: Text(
          'Pantalla de notificaciones',
          style: TextStyle(
            color: Colors.green, // Color del texto
            fontSize: 18, // Tamaño de la fuente
            fontWeight: FontWeight.w600, // Peso medio para destacar
            fontStyle: FontStyle.italic, // Estilo cursivo para el texto
          ),
        ),
      ),
      drawer: const Navbar(),
    );
  }
}
