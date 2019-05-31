import 'package:flutter/material.dart';

import '../product_manager.dart';
import '../counter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Purple Solutions'),
          ),
          body: Column(children: [
            CounterManager(),
            ProductManager('Food Tester'),
          ]),
        );
  }
}


