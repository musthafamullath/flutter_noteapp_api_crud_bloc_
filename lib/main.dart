import 'package:flutter/material.dart';
import 'package:mini_project_note_app_api_bloc/core/themes/light_theme.dart';
import 'package:mini_project_note_app_api_bloc/presentation/screens/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note App',
      theme: lightTheme,
      home: const HomePage(),
    );
  }

}


