import 'package:flutter/material.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resources = [
      {
        'icon': Icons.security,
        'title': 'Campus Security',
        'subtitle': '+1 234-567-8901',
      },
      {
        'icon': Icons.local_hospital,
        'title': 'Health Services',
        'subtitle': '+1 234-567-8902',
      },
      {
        'icon': Icons.help_outline,
        'title': 'Counseling Center',
        'subtitle': '+1 234-567-8903',
      },
      {
        'icon': Icons.link,
        'title': 'Official University Safety Website',
        'subtitle': 'https://www.srmup.in/',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Safety Resources')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: resources.length,
        itemBuilder: (context, index) {
          final resource = resources[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: ListTile(
              leading: Icon(
                resource['icon'] as IconData,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(resource['title'] as String),
              subtitle: Text(resource['subtitle'] as String),
              onTap: () {
                // You can add functionality here, like launching a URL or making a call
              },
            ),
          );
        },
      ),
    );
  }
}
