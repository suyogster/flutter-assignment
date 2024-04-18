import 'package:flutter/material.dart';
import 'package:flutter_assignment/calculator_page.dart';
import 'package:flutter_assignment/notes_page.dart';
import 'package:flutter_assignment/weatherWidget.dart';

class WidgetsPage extends StatelessWidget {
  const WidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Widgets'),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.note), text: 'Notes'),
              Tab(icon: Icon(Icons.calculate), text: 'Calculator'),
              Tab(icon: Icon(Icons.cloud), text: 'Weather'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NotesPage(),
            Calculator(),
            WeatherWidget(),
          ],
        ),
      ),
    );
  }
}
