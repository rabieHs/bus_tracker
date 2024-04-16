import 'package:bus_track/pages/login.dart';
import 'package:bus_track/pages/search_bus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SearchBusScreen());
  }
}
