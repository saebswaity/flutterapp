import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences _preferences;

  static const _keyUsername = 'mohammad';
  static const _keyemail = '####@@#12sdf';
  static const _keycompany = 'aaaa';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String username) async =>
      await _preferences.setString(_keyUsername, username);

  static String getUsername() => _preferences.getString(_keyUsername);
  static Future setemail(String username) async =>
      await _preferences.setString(_keyemail, username);

  static String getemail() => _preferences.getString(_keyemail);
  static Future setcompany(String username) async =>
      await _preferences.setString(_keycompany, username);

  static String getcompany() => _preferences.getString(_keycompany);
}
