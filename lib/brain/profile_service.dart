import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  static const String _nameKey = "name";
  static const String _idKey = "id";
  static const String _contactKey = "contact";

  // Save profile
  static Future<void> saveProfile(
    String name,
    String id,
    String contact,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name);
    await prefs.setString(_idKey, id);
    await prefs.setString(_contactKey, contact);
  }

  // Load profile
  static Future<Map<String, String?>> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "name": prefs.getString(_nameKey),
      "id": prefs.getString(_idKey),
      "contact": prefs.getString(_contactKey),
    };
  }

  // Check if profile exists
  static Future<bool> hasProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_nameKey) &&
        prefs.containsKey(_idKey) &&
        prefs.containsKey(_contactKey);
  }

  // Clear profile
  static Future<void> clearProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_nameKey);
    await prefs.remove(_idKey);
    await prefs.remove(_contactKey);
  }
}
