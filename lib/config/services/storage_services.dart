import 'package:ihun_commerce/config/services/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late final SharedPreferences _preferences;

  Future<StorageServices> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _preferences.getBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME) ??
        false;
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  bool getIsSignedIn() {
    return _preferences.getString(AppConstant.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  Future<bool> remove(String userToken) {
    return _preferences.remove(userToken);
  }
}
