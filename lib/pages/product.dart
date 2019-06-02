import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map product;
  final int index;

  ProductPage(this.product, this.index);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          print('heuhue');
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
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
        ));
  }
}
