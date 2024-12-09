import 'package:flutter/material.dart';
import 'package:menu_lateral/navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inicio',
          style: TextStyle(
            color: Colors.white, // Color del texto en el AppBar
            fontSize: 24, // Tamaño del texto
            fontWeight: FontWeight.bold, // Negrita
          ),
        ),
        backgroundColor: Colors.purple, // Color del fondo del AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '¡Bienvenido!',
              style: TextStyle(
                fontSize: 30, // Tamaño del texto
                fontWeight: FontWeight.bold, // Negrita
                color: Colors.purple, // Color morado al título principal
              ),
            ),
            SizedBox(height: 20), // Espaciado entre los textos
            Text(
              'Esta es la pantalla de inicio.',
              style: TextStyle(
                fontSize: 18, // Tamaño del texto
                color: Colors.black54, // Color gris oscuro al texto secundario
              ),
            ),
          ],
        ),
      ),
      drawer: const Navbar(),
    );
  }
}
