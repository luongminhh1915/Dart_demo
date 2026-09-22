import 'package:flutter/material.dart';
import 'core_widgets_demo.dart';
import 'input_controls_demo.dart';
import 'layout_demo.dart';
import 'app_structure_demo.dart';
import 'ui_fixes_demo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 - Flutter UI Fundamentals'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildExerciseCard(
            'Exercise 1 - Core Widgets Demo',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CoreWidgetsDemo(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          _buildExerciseCard(
            'Exercise 2 - Input Controls Demo',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InputControlsDemo(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          _buildExerciseCard(
            'Exercise 3 - Layout Demo',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LayoutDemo(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          _buildExerciseCard(
            'Exercise 4 - App Structure & Theme',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppStructureDemo(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          _buildExerciseCard(
            'Exercise 5 - Common UI Fixes',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UiFixesDemo(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
