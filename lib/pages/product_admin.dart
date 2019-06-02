import 'package:flutter/material.dart';

import './drawer.dart';

class ProductAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerManager(),
        appBar: AppBar(
          title: Text('Product Admin'),
        ),
        body: Container(
          child: Center(
            child: Text('PRODUCT MANAGER HERE'),
          ),
        ));
  }
}
