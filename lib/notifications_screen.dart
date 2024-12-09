import 'package:flutter/material.dart';
import 'package:menu_lateral/navbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registro de Usuario', // Título de la pantalla
          style: TextStyle(
            color: Colors.white, // Color del texto de la AppBar
            fontWeight: FontWeight.bold, // Negrita para destacar el texto
          ),
        ),
        backgroundColor: Colors.red, // Color de fondo de la AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Creación de Cuenta',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              CreateAccountScreen(), // Aquí agregamos el formulario de registro de usuario
            ],
          ),
        ),
      ),
      drawer: const Navbar(),
    );
  }
}

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Función para validar el correo electrónico
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese un correo electrónico';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Ingrese un correo electrónico válido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Ingrese su Nombre',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese su nombre';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Ingrese un Correo',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              validator: _validateEmail,
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Contraseña',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese una contraseña';
                } else if (value.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                }
                return null;
              },
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Volver atrás
                  },
                  child: Text('Atrás'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Cuenta creada exitosamente')),
                      );
                    }
                  },
                  child: Text('Confirmar Usuario'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
