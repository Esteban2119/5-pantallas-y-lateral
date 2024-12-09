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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Pantalla de configuración',
                  style: TextStyle(
                    color: Colors.orange, // Color del texto del cuerpo
                    fontSize: 18, // Tamaño de fuente
                    fontWeight: FontWeight.w500, // Peso de la fuente medio
                  ),
                ),
              ),
            ),
            // Agregar el formulario de creación de cuenta aquí
            CreateAccountScreen(),
          ],
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
      child: Column(
        children: [
          Text(
            'CREACION DE USUARIO',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          SizedBox(height: 30),
          Form(
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
        ],
      ),
    );
  }
}
