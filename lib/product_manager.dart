import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatelessWidget {
  final List<Map> products;
  final Function deleteProduct;

  ProductManager(this.products, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(
      children: [Expanded(child: Products(products, deleteProduct))],
    );
  }
}
