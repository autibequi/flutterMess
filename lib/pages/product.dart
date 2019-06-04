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
            actions: <Widget>[
              IconButton(
                onPressed: () => {},
                color: Colors.red,
                icon: Icon(Icons.favorite),
              )
            ],
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext dcontext) {
                          return AlertDialog(
                            title: Text('really?'),
                            content: Text('This action cant be undone'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Discart'),
                                onPressed: () {
                                  Navigator.pop(dcontext);
                                },
                              ),
                              FlatButton(
                                child: Text('Keep'),
                                onPressed: () {
                                  Navigator.pop(dcontext);
                                  Navigator.pop(dcontext, true);
                                },
                              )
                            ],
                          );
                        });
                  })
            ],
          ),
        ));
  }
}
