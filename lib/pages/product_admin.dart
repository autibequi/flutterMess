import 'package:flutter/material.dart';

import '../components/drawer.dart';

import './product_create.dart';
import './product_list.dart';

class ProductAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function updateProduct;
  final List<Map> products;

  ProductAdminPage(this.addProduct, this.products, this.updateProduct);

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
              ProductCreatePage(
                addProduct: addProduct,
                updateProduct: updateProduct,
              ),
              ProductListPage(products, updateProduct),
            ],
          ),
        ));
  }
}
