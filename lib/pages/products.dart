import 'package:flutter/material.dart';

import '../widgets/product/product.dart';
import '../components/drawer.dart';
import '../models/product.dart';

class ProductsPage extends StatelessWidget {
  final List<Product> products;
  final Function deleteProduct;

  ProductsPage(this.products, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerManager(),
      appBar: AppBar(
        title: Text('Purple Solutions'),
      ),
      body: Products(products, deleteProduct),
    );
  }
}
