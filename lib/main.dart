import 'package:flutter/material.dart';
import 'package:sqlite_crud/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'S Q L i t e   C R U D',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark().copyWith(
          onPrimary: Colors.purple,
          onSecondary: Colors.purple[100],
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
