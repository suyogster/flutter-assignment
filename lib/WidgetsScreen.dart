import 'package:flutter/material.dart';
import 'package:flutter_assignment/CalculatorWidget.dart';
import 'package:flutter_assignment/NotesWidget.dart';
import 'package:flutter_assignment/WeatherWidget.dart';

// Define a stateless widget to display multiple widgets using tabs.
class WidgetsPage extends StatelessWidget {
  const WidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs.
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Widgets'), // App bar title.
          automaticallyImplyLeading: false, // Don't show back button.
          bottom: const TabBar(
            tabs: [
              Tab(
                  icon: Icon(Icons.note),
                  text: 'Notes'), // Tab for NotesWidget.
              Tab(
                  icon: Icon(Icons.calculate),
                  text: 'Calculator'), // Tab for CalculatorWidget.
              Tab(
                  icon: Icon(Icons.cloud),
                  text: 'Weather'), // Tab for WeatherWidget.
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NotesWidget(), // Display NotesWidget in first tab.
            CalculatorWidget(), // Display CalculatorWidget in second tab.
            WeatherWidget(), // Display WeatherWidget in third tab.
          ],
        ),
      ),
    );
  }
}
