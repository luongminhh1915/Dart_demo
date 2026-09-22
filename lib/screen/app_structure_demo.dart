import 'package:flutter/material.dart';

class AppStructureDemo extends StatefulWidget {
  const AppStructureDemo({super.key});

  @override
  State<AppStructureDemo> createState() => _AppStructureDemoState();
}

class _AppStructureDemoState extends State<AppStructureDemo> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    // We override the theme for this specific screen to demonstrate Theme toggle
    return Theme(
      data: _isDarkMode ? ThemeData.dark(useMaterial3: true) : ThemeData.light(useMaterial3: true),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exercise 4 - App Structure'),
          actions: [
            Row(
              children: [
                const Text('Dark'),
                Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: const Center(
          child: Text('This is a simple screen with theme toggle.'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // FAB action
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('FAB Tapped!')),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
