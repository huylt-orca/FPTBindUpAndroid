import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> saveAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<void> removeAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }
}