import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_app_flutter/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _crateItem(IconData icon, String label, dynamic onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.primary,
            child: const Text(
              "Vamos Cozinhar?",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.black),
            ),
          ),
          SizedBox(),
          _crateItem(
            Icons.restaurant,
            "Refeições",
            () => Navigator.of(context).pushReplacementNamed(AppRputes.HOME),
          ),
          _crateItem(
            Icons.settings,
            "Configurações",
            () => Navigator.of(context).pushReplacementNamed(AppRputes.SETTINGS),
          ),
        ],
      ),
    );
  }
}
