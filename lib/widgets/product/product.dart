import 'package:flutter/material.dart';

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    products[index]['title'],
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
                    child: Text('R\$ ${products[index]['price'].toString()}'),
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
          Text(products[index]['description']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () => Navigator.pushNamed<bool>(
                              context, '/product/' + index.toString())
                          .then((bool value) {
                        if (value) {
                          deleteProduct(index);
                        }
                      })),
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
