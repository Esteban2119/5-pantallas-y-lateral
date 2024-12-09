import 'package:flutter/material.dart';
import 'package:menu_lateral/navbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configuración',
          style: TextStyle(
            color: Colors.white, // Color del texto en la AppBar
            fontWeight: FontWeight.bold, // Negrita para el título
          ),
        ),
        backgroundColor: Colors.teal, // Color de fondo de la AppBar
      ),
      body: const Center(
        child: Text(
          'Pantalla de configuración',
          style: TextStyle(
            color: Colors.orange, // Color del texto del cuerpo
            fontSize: 18, // Tamaño de fuente
            fontWeight: FontWeight.w500, // Peso de la fuente medio
          ),
        ),
      ),
      drawer: const Navbar(),
    );
  }
}
