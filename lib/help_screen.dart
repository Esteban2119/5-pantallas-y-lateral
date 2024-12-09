import 'package:flutter/material.dart';
import 'package:menu_lateral/navbar.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ayuda',
          style: TextStyle(
            color: Colors.white, // Color del texto en la AppBar
            fontWeight: FontWeight.bold, // Negrita para destacar
          ),
        ),
        backgroundColor: Colors.green, // Color de fondo de la AppBar
      ),
      body: const Center(
        child: Text(
          'Pantalla de ayuda',
          style: TextStyle(
            color: Colors.blueGrey, // Color del texto del cuerpo
            fontSize: 18, // Tamaño de fuente
            fontWeight: FontWeight.w600, // Peso medio para resaltar
          ),
        ),
      ),
      drawer: const Navbar(),
    );
  }
}
