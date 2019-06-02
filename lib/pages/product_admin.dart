import 'package:flutter/material.dart';
import 'package:flutter_mess/product_manager.dart';

import './drawer.dart';

import './product_create.dart';
import './products.dart';

class ProductAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: DrawerManager(),
          appBar: AppBar(
            title: Text('Product Admin'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.create),
                  text: 'Create Product',
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: 'Manage Products',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ProductCreatePage(),
              ProductManager(),
            ],
          ),
        ));
  }
}
