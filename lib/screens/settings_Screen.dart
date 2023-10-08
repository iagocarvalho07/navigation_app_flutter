import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_app_flutter/components/main_drawer.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configurações"),),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Configurações"),
      ),
    );
  }
}
