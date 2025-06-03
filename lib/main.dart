import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  title: 'Flashcard Quiz',
  theme: ThemeData(
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: Colors.grey[100],
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
    ),
  ),
  home: HomeScreen(),
);

  }
}
