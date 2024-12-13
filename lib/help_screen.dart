import 'package:flutter/material.dart';
import 'package:menu_lateral/services/firebase_service.dart'; // Asegúrate de importar el servicio

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    // Recibir los argumentos
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    nameController.text = arguments['name'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Nombre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Actualice el nombre',
              ),
            ),
            Text(
              arguments['uid'], // Para verificar el id
              style: const TextStyle(fontSize: 10),
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseService().updatePeople(arguments['uid'], nameController.text)
                      .then((_) {
                    Navigator.pop(context);  // Volver a la pantalla anterior
                  });
                },
                child: const Text("Actualizar"))
          ],
        ),
      ),
    );
  }
}
