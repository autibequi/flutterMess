import 'package:flutter/material.dart';

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

class Products extends StatelessWidget {
  final List<Map> products;
  final Function deleteProduct;

  Products(this.products, this.deleteProduct);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              products[index]['title'],
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                // fontFamily: 'remachine'
              ),
            ),
          ),
          Text(products[index]['description']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  child: Text('Details'),
                  onPressed: () => Navigator.pushNamed<bool>(
                              context, '/product/' + index.toString())
                          .then((bool value) {
                        if (value) {
                          deleteProduct(index);
                        }
                      }))
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCards = Container();
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return _buildProductList();
  }
}
