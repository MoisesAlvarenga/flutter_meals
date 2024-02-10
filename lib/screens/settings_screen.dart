import 'package:flutter/material.dart';
import 'package:flutter_meals/components/main_drawer.dart';
import 'package:flutter_meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();
  @override
  Widget build(BuildContext context) {
    Widget _createSwitch(
      String title,
      String subtitle,
      bool value,
      void Function(bool) onChanged,
    ) {
      return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(settings);
        },
      );
    }

    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                  'Sem Glutén',
                  'Só exibe refeições sem glutén!',
                  settings.isGlutenFree,
                  (value) => setState(() {
                        settings.isGlutenFree = value;
                      })),
              _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose!',
                  settings.isLactoseFree,
                  (value) => setState(() {
                        settings.isLactoseFree = value;
                      })),
              _createSwitch(
                  'Vegana',
                  'Só exibe refeições sem veganas!',
                  settings.isVegan,
                  (value) => setState(() {
                        settings.isVegan = value;
                      })),
              _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições sem vegetarianas!',
                  settings.isVegetarian,
                  (value) => setState(() {
                        settings.isVegetarian = value;
                      }))
            ],
          ))
        ],
      ),
    ));
  }
}
