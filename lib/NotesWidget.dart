import 'package:flutter/material.dart';

// Define a stateful widget for managing notes.
class NotesWidget extends StatefulWidget {
  const NotesWidget({super.key}); // Constructor for NotesWidget.

  @override
  _NotesPageState createState() =>
      _NotesPageState(); // Create state for the widget.
}

// Define the state for NotesWidget.
class _NotesPageState extends State<NotesWidget> {
  final List<String> _notes = []; // List to store notes.

  final TextEditingController _textController =
      TextEditingController(); // Controller for text input.

  // Function to add a note to the list.
  void _addNote() {
    String text = _textController.text;
    if (text.isNotEmpty) {
      setState(() {
        _notes.add(text); // Add note to the list.
        _textController.clear(); // Clear input field.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'), // App bar title.
        backgroundColor: Colors.yellow, // App bar background color.
      ),
      body: Column(
        children: [
          // Input field for adding notes.
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter your notes', // Input field label.
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send), // Send icon.
                  onPressed: _addNote, // Add note when icon is pressed.
                ),
              ),
              onSubmitted: (value) => _addNote(), // Add note on submit.
            ),
          ),
          // Display the list of notes using ListView.builder.
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_notes[index]), // Display note text.
                  trailing: IconButton(
                    icon: const Icon(Icons.delete), // Delete icon.
                    onPressed: () {
                      setState(() {
                        _notes.removeAt(
                            index); // Remove note when delete icon is pressed.
                      });
                    },
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
