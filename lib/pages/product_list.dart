import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final List<Map> product;

  ProductListPage(this.product);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: Image.asset(product[index]['image']),
            title: Text(product[index]['title']));
      },
      itemCount: product.length,
    );
  }
}
