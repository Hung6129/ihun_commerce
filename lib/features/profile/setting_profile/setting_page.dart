import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ihun_commerce/global.dart';

import 'package:ihun_commerce/config/routes/app_routes_name.dart';


import '../../../core/services/constant.dart';
import 'bloc/settings_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Confirm sign out'),
                          content: const Text(
                            'Are you sure you want to sign out?',
                          ),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('Yes'),
                              onPressed: () {
                                Global.storageServices
                                    .remove(AppConstant.STORAGE_USER_TOKEN_KEY);
                                Navigator.pushNamedAndRemoveUntil(context,
                                    AppRoutesName.SIGN_IN, (route) => false);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                  ),
                  label: const Text(
                    'Sign out',
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
