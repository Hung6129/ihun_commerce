import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    super.key,
    required this.brightnessButton,
    required this.colorSeedButton,
  });
  final Widget brightnessButton;
  final Widget colorSeedButton;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: ListView(
        children: [
          ListTile(
              title: const Text('Change Theme'),
              trailing: widget.brightnessButton),
          ListTile(
              title: const Text('Change App Color'),
              trailing: widget.colorSeedButton)
        ],
      ),
    );
  }
}
