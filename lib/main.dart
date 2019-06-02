import 'package:flutter/material.dart';

import './pages/auth.dart';

import './pages/products.dart';
import './pages/product_admin.dart';

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
      routes: {
        '/': (BuildContext context) => AuthPage(),
        'productList': (BuildContext context) => ProductsPage(),
        'productAdmin': (BuildContext context) => ProductAdminPage(),
      },
    );
  }
}
