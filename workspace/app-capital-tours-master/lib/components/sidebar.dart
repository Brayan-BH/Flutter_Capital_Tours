import 'package:app_capital_tours/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: defaultColorApp,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Alicia Mcfly',
                style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: const Text('alice415@gmail.com',
                style: TextStyle(fontWeight: FontWeight.bold)),
            currentAccountPicture: CircleAvatar(
              radius: 2,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/girl-profile.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: defaultColorApp2,
              // image: DecorationImage(
              //   image: AssetImage('assets/images/ocean.jpg'),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text('Inicio', style: TextStyle(color: Colors.white)),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.white),
            title:
                const Text('Historial', style: TextStyle(color: Colors.white)),
            onTap: () => Get.toNamed('/home/history'),
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text('Configuración',
                style: TextStyle(color: Colors.white)),
            onTap: () => {},
          ),
          const Divider(color: Colors.grey),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.white),
            title: const Text('Cerrar sesión',
                style: TextStyle(color: Colors.white)),
            onTap: () => Get.offAllNamed('/login'),
          ),
        ],
      ),
    );
  }
}
