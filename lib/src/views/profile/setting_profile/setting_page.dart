import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihun_commerce/src/views/profile/setting_profile/bloc/settings_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<SettingsBloc,SettingsState>(
          builder: (context, state) => Column(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                ),
                label: const Text(
                  'Sign out',
                ),
              ),
            ],
          ),
        ));
  }
}
