import "package:flutter/material.dart";

class ProductControl extends StatelessWidget {
  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addProduct('Add Product from Controller');
      },
      child: Text('Add Product'),
    );
  }
}
