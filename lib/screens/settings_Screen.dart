import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_app_flutter/components/main_drawer.dart';
import 'package:navigation_app_flutter/models/settings.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({super.key, required this.onSettingschange, required this.setting});

  final Setting setting;

  final Function(Setting) onSettingschange;
  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  Setting? settings;
  @override
  void initState() {
    super.initState();
    settings = widget.setting;
  }

  Widget _createSwich(
    String title,
    String subtitles,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitles),
      value: value,
      onChanged: (value){
        onChanged(value);
        widget.onSettingschange(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Configurações",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwich(
                  "Sem Lactose",
                  "So Exibe Refeições sem Lactose",
                  settings!.isLactoseFree,
                  (value) => setState(() => settings!.isLactoseFree = value)),
              _createSwich(
                  "Vegano",
                  "So Exibe Refeições Veganas",
                  settings!.isVegan,
                  (value) => setState(() => settings!.isVegan = value)),
              _createSwich(
                  "Sem Glutén",
                  "So Exibe Refeições sem gluten",
                  settings!.isGlutenFree,
                  (value) => setState(() => settings!.isGlutenFree = value)),
              _createSwich(
                  "Vegetarianas",
                  "So Exibe Refeições Vegitarianas",
                  settings!.isVegetarian,
                  (value) => setState(() => settings!.isVegetarian = value)),
            ],
          ))
        ],
      ),
    );
  }
}
