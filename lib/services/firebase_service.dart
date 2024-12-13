import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Método para obtener la lista de personas
  Future<List<Map<String, dynamic>>> getPeople() async {
    List<Map<String, dynamic>> people = [];
    try {
      QuerySnapshot querySnapshot = await _db.collection('people').get();
      for (var doc in querySnapshot.docs) {
        people.add(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print("Error obteniendo datos de Firebase: $e");
    }
    return people;
  }

  // Método para agregar un nuevo nombre a la colección 'people'
  Future<void> saveName(String name) async {
    try {
      await _db.collection('people').add({'name': name});
    } catch (e) {
      print("Error guardando nombre en Firebase: $e");
    }
  }

 // Eliminar persona
  Future<void> deletePerson(String id) async {
    try {
      await _db.collection('people').doc(id).delete();
    } catch (e) {
      print("Error al eliminar persona: $e");
    }
  }

  // Actualizar nombre
  Future<void> updatePeople(String id, String name) async {
    try {
      await _db.collection('people').doc(id).update({'name': name});
    } catch (e) {
      print("Error al actualizar persona: $e");
    }
  }

}
