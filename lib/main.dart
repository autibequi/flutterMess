import 'package:flutter/material.dart';

import './pages/auth.dart';

import './pages/products.dart';
import './pages/product.dart';
import './pages/product_admin.dart';

// Instantiate the Main AppClass
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// Main App Class
class _MyAppState extends State<MyApp> {
  List<Map> _products = [];

  void _addProduct(String productName) {
    setState(() {
      var product = {
        'image': 'assets/food.jpg',
        'title': productName,
      };
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    _products.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: AuthPage(),
      routes: {
        'productList': (BuildContext context) =>
            ProductsPage(_products, _addProduct, _deleteProduct),
        'productAdmin': (BuildContext context) => ProductAdminPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');

        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) =>
                ProductPage(_products[index], index),
          );
        }
      },
    );
  }
}
