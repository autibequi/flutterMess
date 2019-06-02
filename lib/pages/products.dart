import 'package:flutter/material.dart';

import '../product_manager.dart';
import './drawer.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerManager(),
      appBar: AppBar(
        title: Text('Purple Solutions'),
      ),
      body: ProductManager(),
    );
  }
}
