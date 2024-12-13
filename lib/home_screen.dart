import 'package:flutter/material.dart';
import 'package:menu_lateral/navbar.dart';
import 'package:menu_lateral/profile_screen.dart'; // Pantalla para agregar usuario
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Obtener datos de Firebase
  Future<List<Map<String, dynamic>>> fetchPeople() async {
    List<Map<String, dynamic>> people = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('people').get();
      for (var doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Añadir el ID del documento
        people.add(data);
      }
    } catch (e) {
      debugPrint('Error obteniendo datos de Firebase: $e');
    }
    return people;
  }

  // Eliminar usuario con confirmación
  Future<void> deletePerson(BuildContext context, String docId) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirmar eliminación"),
        content: const Text("¿Estás seguro de que deseas eliminar este usuario?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // Cancelar
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true), // Confirmar
            child: const Text("Eliminar"),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await FirebaseFirestore.instance.collection('people').doc(docId).delete();
        setState(() {}); // Actualizar la lista después de eliminar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Usuario eliminado exitosamente.")),
        );
      } catch (e) {
        debugPrint('Error eliminando usuario: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error al eliminar el usuario.")),
        );
      }
    }
  }

  // Crear una nueva persona en Firebase
  Future<void> addPerson(String name) async {
    try {
      await FirebaseFirestore.instance.collection('people').add({'name': name});
      setState(() {}); // Actualiza la vista después de agregar la persona
    } catch (e) {
      debugPrint('Error agregando persona: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al agregar el usuario.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inicio',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>( 
              future: fetchPeople(), 
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error al cargar los datos'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay datos disponibles'));
                } else {
                  final people = snapshot.data!;
                  return ListView.builder(
                    itemCount: people.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: ListTile(
                          title: Text(people[index]['name']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/help',
                                    arguments: {
                                      'uid': people[index]['id'],
                                      'name': people[index]['name'],
                                    },
                                  ).then((_) {
                                    setState(() {}); // Actualizar lista al regresar
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => deletePerson(context, people[index]['id']),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Agregar nuevo usuario',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const Navbar(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width * 0.4,
    );
  }
}
