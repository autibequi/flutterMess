import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map product;
  final int index;

  ProductPage(this.product, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(product['image']),
          Container(padding: EdgeInsets.all(10.0), child: Text('Details!')),
          RaisedButton(
            child: Text('Delete!'),
            color: Colors.red,
            onPressed: () => Navigator.pop(context, index),
          )
        ],
      ),
    );
  }
}
