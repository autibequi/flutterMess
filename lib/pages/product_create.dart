import 'package:flutter/material.dart';
import 'package:flutter_mess/models/product.dart';
import 'package:flutter_mess/scoped-models/product.dart';
import 'package:scoped_model/scoped_model.dart';

bool _isNumeric(String str) {
  if (str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Product product;
  final int index;

  ProductCreatePage(
      {this.addProduct, this.product, this.index, this.updateProduct});

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
        initialValue: widget.product == null ? '' : widget.product.title,
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
        initialValue: widget.product == null ? '' : widget.product.description,
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
        initialValue:
            widget.product == null ? '' : widget.product.price.toString(),
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

  Widget _buildSumitbutton() {
    return ScopedModelDescendant<ProductModel>(
      builder: (BuildContext context, Widget child, ProductModel model) {
        return RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Text('Submit'),
          onPressed: () {
            if (!_formKey.currentState.validate()) {
              return; // stops if validation is false
            }

            _formKey.currentState.save();
            Product productToCreate = new Product(
              title: newProduct['title'],
              description: newProduct['description'],
              image: newProduct['image'],
              price: newProduct['price'],
            );

            if (widget.product == null) {
              model.addProduct(productToCreate);
            } else {
              model.updateProduct(widget.index, productToCreate);
            }

            Navigator.pushReplacementNamed(context, 'productList');
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget PageItself = GestureDetector(
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
                    _buildSumitbutton(),
                  ],
                ))));
    if (widget.product == null) {
      return PageItself;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Mode'),
        ),
        body: PageItself);
  }
}
