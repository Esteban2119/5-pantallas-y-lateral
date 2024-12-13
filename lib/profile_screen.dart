import 'package:flutter/material.dart';
import 'package:menu_lateral/navbar.dart';
import 'services/firebase_service.dart';  // Asegúrate de importar el servicio

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseService _firebaseService = FirebaseService();  // Instancia del servicio
  final TextEditingController _nameController = TextEditingController();

  Future<void> _addName() async {
    String name = _nameController.text.trim();
    if (name.isNotEmpty) {
      await _firebaseService.saveName(name);
      _nameController.clear();  // Limpiar el campo después de agregar
      setState(() {});  // Actualizar la pantalla si es necesario
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nombre guardado exitosamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Formulario para agregar un nombre
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Ingresa un nombre',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addName,
              child: const Text('Agregar Nombre'),
            ),
          ],
        ),
      ),
      drawer: const Navbar(),
    );
  }
}
