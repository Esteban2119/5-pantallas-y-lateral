import 'package:flutter/material.dart';
import 'package:menu_lateral/navbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
          style: TextStyle(
            color: Colors.white, // Color del texto en la AppBar
            fontWeight: FontWeight.bold, // Negrita para destacar
          ),
        ),
        backgroundColor: Colors.indigo, // Color de fondo de la AppBar
      ),
      body: const Center(
        child: Text(
          'Pantalla de perfil',
          style: TextStyle(
            color: Colors.deepOrange, // Color del texto
            fontSize: 18, // Tamaño de fuente
            fontWeight: FontWeight.w500, // Peso medio para resaltar
          ),
        ),
      ),
      drawer: const Navbar(),
    );
  }
}
