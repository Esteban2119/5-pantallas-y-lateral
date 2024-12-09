import 'package:flutter/material.dart';
import 'package:menu_lateral/navbar.dart'; // Menú lateral
import 'package:menu_lateral/home_screen.dart'; // Pantalla de inicio
import 'package:menu_lateral/settings_screen.dart'; // Pantalla de configuración
import 'package:menu_lateral/notifications_screen.dart'; // Pantalla de notificaciones
import 'package:menu_lateral/profile_screen.dart'; // Pantalla de perfil
import 'package:menu_lateral/help_screen.dart'; // Pantalla de ayuda

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/home', // Ruta inicial
      routes: {
        '/home': (context) => const HomeScreen(), // Pantalla de inicio
        '/pruebas': (context) => const SettingsScreen(), // Configuración
        '/notifications': (context) => const NotificationsScreen(), // Notificaciones
        '/profile': (context) => const ProfileScreen(), // Perfil
        '/help': (context) => const HelpScreen(), // Ayuda
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
