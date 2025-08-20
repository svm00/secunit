import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  static const String _nameKey = "name";
  static const String _idKey = "id";
  static const String _contactKey = "contact";
  static const String _imagePathKey = "image_path";
  static const String _emergencyContactsKey = "emergency_contacts";

  // Save profile
  static Future<void> saveProfile(
    String name,
    String id,
    String contact,
    String? imagePath,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, name);
    await prefs.setString(_idKey, id);
    await prefs.setString(_contactKey, contact);
    if (imagePath != null) {
      await prefs.setString(_imagePathKey, imagePath);
    } else {
      await prefs.remove(_imagePathKey);
    }
  }

  // Load profile
  static Future<Map<String, String?>> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "name": prefs.getString(_nameKey),
      "id": prefs.getString(_idKey),
      "contact": prefs.getString(_contactKey),
      "imagePath": prefs.getString(_imagePathKey),
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
    await prefs.remove(_imagePathKey);
    await prefs.remove(_emergencyContactsKey);
  }

  // Save emergency contacts
  static Future<void> saveEmergencyContacts(
    List<Map<String, String>> contacts,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> contactsJson = contacts.map((c) => json.encode(c)).toList();
    await prefs.setStringList(_emergencyContactsKey, contactsJson);
  }

  // Load emergency contacts
  static Future<List<Map<String, String>>> loadEmergencyContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsJson = prefs.getStringList(_emergencyContactsKey);
    if (contactsJson == null) {
      return [];
    }
    return contactsJson
        .map((c) => json.decode(c) as Map<String, dynamic>)
        .map((m) => m.map((k, v) => MapEntry(k, v.toString())))
        .toList();
  }

  // Add an emergency contact
  static Future<void> addEmergencyContact(Map<String, String> contact) async {
    final contacts = await loadEmergencyContacts();
    contacts.add(contact);
    await saveEmergencyContacts(contacts);
  }

  // Remove an emergency contact
  static Future<void> removeEmergencyContact(int index) async {
    final contacts = await loadEmergencyContacts();
    if (index >= 0 && index < contacts.length) {
      contacts.removeAt(index);
      await saveEmergencyContacts(contacts);
    }
  }
}
