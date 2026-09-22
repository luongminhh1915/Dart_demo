import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of movies
    final List<String> movies = ['Avatar', 'Inception', 'Interstellar', 'Joker'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 - Layout Demo'),
      ),
      body: Column(
        children: [
          // Section Title
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Now Playing',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // ListView.builder for movie items
          // Use Expanded to take up remaining space in the Column
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movieTitle = movies[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo.shade100,
                        foregroundColor: Colors.indigo.shade800,
                        child: Text(movieTitle[0]), // First letter of the movie
                      ),
                      title: Text(movieTitle),
                      subtitle: const Text('Sample description'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
