import 'dart:developer';

import 'package:flutter/material.dart';

bool _isNumeric(String str) {
  if (str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  _ProductCreatePageState createState() => _ProductCreatePageState();
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  Map newProduct = {
    'image': 'assets/food.jpg',
  };
  bool isCool = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildProductNameField() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Product Name'),
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return 'Title is required';
          }
        },
        onSaved: (String value) {
          newProduct['title'] = value;
        });
  }

  Widget _buildProductDescriptionField() {
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Product Description',
        ),
        maxLines: 4,
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return 'Description is required';
          }
        },
        onSaved: (String value) {
          newProduct['description'] = value;
        });
  }

  Widget _buildProductPriceField() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Product Price'),
        keyboardType: TextInputType.number,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Price is required';
          }
          if (!_isNumeric(value)) {
            return 'Price must be a number.';
          }
        },
        onSaved: (String value) {
          newProduct['price'] = double.parse(value);
        });
  }

  Widget _buildIsItCoolSwitch() {
    return SwitchListTile(
      value: isCool,
      onChanged: (bool value) {
        newProduct['isCool'] = value;
      },
      title: Text('is it cool?'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
            padding: EdgeInsets.all(10.0),
            child: Form(
                key: _formKey,
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
                        if (!_formKey.currentState.validate()) {
                          return; // stops if validation is false
                        }
                        _formKey.currentState.save();

                        widget.addProduct(newProduct);
                        Navigator.pushReplacementNamed(context, 'productList');
                      },
                    )
                  ],
                ))));
  }
}
