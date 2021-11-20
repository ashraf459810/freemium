import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefsHelper {
  Future<SharedPreferences> getPrefs();
  Future<void> setsupportcontactsaved();
  Future<bool> getsupportcontactsaved();

  Future<void> setemergencycontactsaved();
  Future<bool> getemergencycontactsaved();
  Future<void> savetoken(String token);
  Future<String> getToken();
  Future<void> setIslogin(bool islogin);
  Future<bool> getIsLogin();
}
