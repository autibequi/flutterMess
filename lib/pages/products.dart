import 'package:flutter/material.dart';

import '../product_manager.dart';
import '../components/drawer.dart';

class ProductsPage extends StatelessWidget {
  final List<Map> products;
  final Function deleteProduct;

  ProductsPage(this.products, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerManager(),
      appBar: AppBar(
        title: Text('Purple Solutions'),
      ),
      body: ProductManager(products, deleteProduct),
    );
  }
}
