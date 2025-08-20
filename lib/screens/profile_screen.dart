import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:secunit/screens/emergency_contacts_screen.dart';
import 'package:secunit/theme.dart';

import '../brain/profile_service.dart';
import '../brain/profile_setup.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, String?> _profile = {};
  File? _image;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final data = await ProfileService.loadProfile();
    setState(() {
      _profile = data;
      if (data['imagePath'] != null) {
        _image = File(data['imagePath']!);
      }
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      await ProfileService.saveProfile(
        _profile['name']!,
        _profile['id']!,
        _profile['contact']!,
        _image!.path,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile"), elevation: 0),
      body: _profile["name"] == null
          ? const Center(child: Text("No profile found. Please set it up."))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : null,
                          child: _image == null
                              ? const Icon(Icons.person, size: 60)
                              : null,
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _profile['name'] ?? 'Your Name',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.badge_outlined),
                          title: const Text("Student ID"),
                          subtitle: Text(_profile["id"] ?? ""),
                        ),
                        ListTile(
                          leading: const Icon(Icons.phone_outlined),
                          title: const Text("Emergency Contact"),
                          subtitle: Text(_profile["contact"] ?? ""),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.edit_outlined),
                          title: const Text("Edit Profile"),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileSetupScreen(),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.contacts_outlined),
                          title: const Text("Manage Emergency Contacts"),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const EmergencyContactsScreen(),
                            ),
                          ),
                        ),
                        Consumer<ThemeNotifier>(
                          builder: (context, theme, child) {
                            return SwitchListTile(
                              secondary: const Icon(
                                Icons.brightness_6_outlined,
                              ),
                              title: const Text("Dark Mode"),
                              value: theme.isDarkMode,
                              onChanged: (value) => theme.toggleTheme(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
