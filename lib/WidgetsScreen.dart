import 'package:flutter/material.dart';
import 'package:flutter_assignment/CalculatorWidget.dart';
import 'package:flutter_assignment/NotesWidget.dart';
import 'package:flutter_assignment/WeatherWidget.dart';

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
            NotesWidget(),
            CalculatorWidget(),
            WeatherWidget(),
          ],
        ),
      ),
    );
  }
}
