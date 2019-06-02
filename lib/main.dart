import 'package:flutter/material.dart';

import './pages/auth.dart';

// Instantiate the Main AppClass
void main() => runApp(MyApp());

// Main App Class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: AuthPage(),
    );
  }
}
