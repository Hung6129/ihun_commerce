import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ihun_commerce/src/common/services/storage_services.dart';



class Global {
  static late StorageServices storageServices;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    storageServices = await StorageServices().init();
  }
}
