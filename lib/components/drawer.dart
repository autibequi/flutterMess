import 'package:flutter/material.dart';

class DrawerManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
          ListTile(
              title: Text('Manage Products'),
              onTap: () {
                Navigator.pushNamed(context, 'productAdmin');
              }),
          ListTile(
              title: Text('List Products'),
              onTap: () {
                Navigator.pushNamed(context, 'productList');
              }),
        ],
      ),
    );
  }
}
