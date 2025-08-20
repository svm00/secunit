import 'package:flutter/material.dart';

import '../brain/profile_service.dart';
import '../brain/profile_setup.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, String?> _profile = {};

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final data = await ProfileService.loadProfile();
    setState(() {
      _profile = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _profile["name"] == null
            ? const Text("No profile found. Please set it up.")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: ${_profile["name"] ?? ""}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Student ID: ${_profile["id"] ?? ""}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Contact: ${_profile["contact"] ?? ""}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileSetupScreen(),
                        ),
                      );
                    },
                    child: const Text("Edit Profile"),
                  ),
                ],
              ),
      ),
    );
  }
}
