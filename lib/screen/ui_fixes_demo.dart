import 'package:flutter/material.dart';

class UiFixesDemo extends StatefulWidget {
  const UiFixesDemo({super.key});

  @override
  State<UiFixesDemo> createState() => _UiFixesDemoState();
}

class _UiFixesDemoState extends State<UiFixesDemo> {
  int _counter = 0;
  DateTime? _selectedDate;

  // Task 4: Valid build context for DatePicker
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      // Task 3: Fix state update issue by adding setState()
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 - Common UI Fixes'),
      ),
      // Task 2: Fix overflow in small screens using SingleChildScrollView
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Correct ListView inside Column using Expanded',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 16),
              
              // Task 1: Fix ListView inside Column using Expanded
              // Since this entire block is inside a SingleChildScrollView, 
              // using Expanded directly inside Column will crash because 
              // SingleChildScrollView gives infinite height. 
              // To demonstrate fixing a ListView inside a Column, we'll wrap 
              // it in a SizedBox with a fixed height here.
              // (Alternatively, if you didn't have SingleChildScrollView, 
              // you would just use Expanded).
              SizedBox(
                height: 300, 
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          final char = String.fromCharCode('A'.codeUnitAt(0) + index);
                          return ListTile(
                            leading: const Icon(Icons.movie_creation),
                            title: Text('Movie $char'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              
              const Divider(height: 32),
              
              // Demonstrating Task 3 (setState)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('State Update Counter: $_counter'),
                  ElevatedButton(
                    onPressed: () {
                      // Fix state update issue by adding setState()
                      setState(() {
                        _counter++;
                      });
                    },
                    child: const Text('Increment'),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),

              // Demonstrating Task 4 (Valid Context for DatePicker)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // Use Builder context or the context from the build method directly
                  onPressed: () => _pickDate(context),
                  child: Text(
                    _selectedDate == null 
                        ? 'Pick a Date' 
                        : 'Selected: ${_selectedDate.toString().split(' ')[0]}',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
