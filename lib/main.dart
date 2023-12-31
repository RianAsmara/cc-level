import 'package:flutter/material.dart';
import 'package:interviews_rian_asmara/home_page.dart';
import 'package:interviews_rian_asmara/level_vertical_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  // final flutterWebviewPlugin = FlutterWebviewPlugin();
  // flutterWebviewPlugin.launch('http://localhost:8080/index.html');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}