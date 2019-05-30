import 'package:flutter/material.dart';

import './product_manager.dart';
import './counter.dart';

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
        home: Scaffold(
          appBar: AppBar(
            title: Text('Purple Solutions'),
          ),
          body: Column(children: [
            CounterManager(),
            ProductManager('Food Tester'),
          ]),
        ));
  }
}
