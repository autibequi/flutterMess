import 'dart:developer';

import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  _ProductCreatePageState createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String title;
  String description;
  double price;
  bool isCool = false;

  Widget _buildProductNameField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Name'),
      onChanged: (String value) {
        setState(() {
          title = value;
        });
      },
    );
  }

  Widget _buildProductDescriptionField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Product Description',
      ),
      maxLines: 4,
      onChanged: (String value) {
        setState(() {
          description = value;
        });
      },
    );
  }

  Widget _buildProductPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Price'),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        setState(() {
          price = double.parse(value);
        });
      },
    );
  }

  Widget _buildIsItCoolSwitch() {
    return SwitchListTile(
      value: isCool,
      onChanged: (bool value) {
        setState(() {
          isCool = value;
        });
      },
      title: Text('is it cool?'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            _buildProductNameField(),
            _buildProductDescriptionField(),
            _buildProductPriceField(),
            _buildIsItCoolSwitch(),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text('Submit'),
              onPressed: () {
                Map newProduct = {
                  'title': title,
                  'description': description,
                  'price': price,
                  'image': 'assets/food.jpg',
                };
                widget.addProduct(newProduct);
                Navigator.pushReplacementNamed(context, 'productList');
              },
            )
          ],
        ));
  }
}
