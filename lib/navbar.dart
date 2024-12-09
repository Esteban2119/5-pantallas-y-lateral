import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Esteban"),
            accountEmail: const Text("esteban@gmail.com.edu.ec"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("images/leon3.jpg"),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Inicio"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Configuración"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/pruebas');
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notificaciones"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/notifications');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Perfil"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text("Ayuda"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/help');
            },
          ),
        ],
      ),
    );
  }
}
