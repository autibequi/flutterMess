import 'dart:developer';

import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  @override
  _ProductCreatePageState createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String title;
  String description;
  double price;
  bool isCool = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Product Name'),
              onChanged: (String value) {
                setState(() {
                  title = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Product Description',
              ),
              maxLines: 4,
              onChanged: (String value) {
                setState(() {
                  description = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Product Price'),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  price = double.parse(value);
                });
              },
            ),
            SwitchListTile(
              value: isCool,
              onChanged: (bool value) {
                setState(() {
                  isCool = value;
                });
              },
              title: Text('is it cool?'),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text('Submit'),
              onPressed: () {
                // TODO: Add new Product
                // TODO: Go to Listing
              },
            )
          ],
        ));
  }
}
