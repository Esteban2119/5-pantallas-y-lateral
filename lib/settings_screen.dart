import 'package:flutter/material.dart';
import 'package:menu_lateral/navbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _showButtons = false; // Controla la visibilidad de los botones deslizables

  @override
  void initState() {
    super.initState();
    // Inicializar AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Definir animación de deslizamiento
    _slideAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(1.5, 0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Función para mostrar un mensaje de alerta
  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mensaje'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
            // Carta de presentación
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Imagen de perfil
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/barou.jpg'), // Cambia la ruta a tu imagen
                      ),
                      const SizedBox(height: 10),
                      // Nombre
                      Text(
                        'Esteban',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Información adicional
                      Text(
                        'Soy desarrollador de software y apasionado por la tecnología. Trabajo en proyectos relacionados con Flutter y desarrollo web.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Botones
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Acción del botón 1
                              _showAlert('¡Botón 1 presionado!');
                            },
                            child: Text('Botón 1'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Acción del botón 2
                              _showAlert('¡Botón 2 presionado!');
                            },
                            child: Text('Botón 2'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Botones deslizantes
                      SlideTransition(
                        position: _slideAnimation,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _showAlert('¡Botón 3 presionado!');
                              },
                              child: Text('Botón 3'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _showAlert('¡Botón 4 presionado!');
                              },
                              child: Text('Botón 4'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Botón para iniciar la animación
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showButtons = !_showButtons; // Alterna la visibilidad de los botones deslizables
                });
                if (_showButtons) {
                  _animationController.forward(); // Inicia la animación de deslizamiento
                } else {
                  _animationController.reverse(); // Reversa la animación si se presiona otra vez
                }
              },
              child: Text(_showButtons ? 'Ocultar Botones' : 'Deslizar Botones'),
            ),
          ],
        ),
      ),
      drawer: const Navbar(),
    );
  }
}
