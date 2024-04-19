// Import necessary packages and files.
import 'package:flutter/material.dart';
import 'package:flutter_assignment/WidgetsScreen.dart';

// Define a stateless widget for the greeting screen.
class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key}); // Constructor for GreetingScreen.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome!'), // App bar title.
        foregroundColor:
            const Color.fromARGB(255, 241, 241, 243), // Text color.
        backgroundColor:
            const Color.fromARGB(255, 51, 51, 124), // Background color.
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 180, 187, 209), // Gradient color 1.
              Color.fromARGB(255, 11, 18, 103), // Gradient color 2.
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display a text widget.
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Flutter - Mobile Web App Assignment',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color.
                ),
              ),
            ),
            // Display an image with rounded corners.
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/greeting.jpeg', // Image path.
                width: 800,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            // Display an elevated button.
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, // Text color.
                  backgroundColor:
                      const Color.fromARGB(255, 177, 8, 16), // Button color.
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 16), // Button padding.
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const WidgetsPage())), // Navigate to WidgetsPage.
                child: const Text('List of Widgets', // Button text.
                    style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
