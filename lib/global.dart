import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/services/storage_services.dart';

class Global {
  static late StorageServices storageServices;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    storageServices = await StorageServices().init();
  }
}
