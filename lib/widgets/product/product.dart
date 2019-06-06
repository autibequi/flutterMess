import 'package:flutter/material.dart';
import 'package:flutter_mess/models/product.dart';
import 'package:flutter_mess/scoped-models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class Products extends StatelessWidget {
  final List<Product> products = [];

  Widget _buildProductItem(Product product) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'remachine'
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.5, horizontal: 6.0),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade200,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text('R\$ ${product.title.toString()}'),
                  )
                ],
              )),
          DecoratedBox(
              child: Padding(
                  child: Text('Sao Gonçalo, RJ'),
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2)),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              )),
          Text(product.description),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              // TODO: FIX IT
              // IconButton(
              //     icon: Icon(Icons.info),
              //     onPressed: () => Navigator.pushNamed<bool>(
              //                 context, '/product/' + index.toString())
              //             .then((bool value) {
              //           if (value) {
              //             product.deleteProduct(index);
              //           }
              //         })),
              IconButton(
                color: Colors.red,
                icon: Icon(Icons.favorite_border),
                onPressed: () => {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(List<Product> products) {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            _buildProductItem(products[index]),
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
    return ScopedModelDescendant<ProductModel>(
      builder: (BuildContext context, Widget child, ProductModel model) {
        return _buildProductList(model.products);
      },
    );
  }
}
