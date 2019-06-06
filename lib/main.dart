import 'package:flutter/material.dart';

import 'package:flutter_mess/pages/auth.dart';

import 'package:flutter_mess/pages/products.dart';
import 'package:flutter_mess/pages/product.dart';
import 'package:flutter_mess/pages/product_admin.dart';
import 'package:flutter_mess/models/product.dart';
import 'package:flutter_mess/scoped-models/product.dart';

import 'package:scoped_model/scoped_model.dart';

// Instantiate the Main AppClass
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// Main App Class
class _MyAppState extends State<MyApp> {
  List<Product> _products = [];

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductModel>(
        model: ProductModel(),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: AuthPage(),
          routes: {
            'productList': (BuildContext context) => ProductsPage(),
            'productAdmin': (BuildContext context) => ProductAdminPage(),
          },
          onUnknownRoute: (RouteSettings settings) {
            return MaterialPageRoute(
                builder: (BuildContext context) => AuthPage());
          },
          onGenerateRoute: (RouteSettings settings) {
            final List<String> pathElements = settings.name.split('/');

            if (pathElements[0] != '') {
              return null;
            }

            if (pathElements[1] == 'product') {
              final int index = int.parse(pathElements[2]);
              return MaterialPageRoute<bool>(
                builder: (BuildContext context) => ProductPage(null, null),
              );
            }
          },
        ));
  }
}
