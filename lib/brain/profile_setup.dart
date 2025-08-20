import 'package:flutter/material.dart';

import '../brain/profile_service.dart';
import '../main.dart'; // ✅ to access MainNavigationScreen

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      await ProfileService.saveProfile(
        _nameController.text,
        _idController.text,
        _contactController.text,
      );

      if (!mounted) return; // ✅ safety check
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
      );
    }
  }

  void _skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Set up your Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: (value) =>
                    value!.isEmpty ? "Please enter your name" : null,
              ),
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(labelText: "Student ID"),
                validator: (value) =>
                    value!.isEmpty ? "Please enter student ID" : null,
              ),
              TextFormField(
                controller: _contactController,
                decoration: const InputDecoration(
                  labelText: "Emergency Contact Number",
                ),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? "Please enter contact number" : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Save Profile"),
                onPressed: _saveProfile,
              ),
              TextButton(onPressed: _skip, child: const Text("Skip for now")),
            ],
          ),
        ),
      ),
    );
  }
}
