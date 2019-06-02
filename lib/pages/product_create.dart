import 'package:flutter/material.dart';

class ProductCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Me aperta!'),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext dcontext) {
                return Center(child: Text('Cheguei!'));
              });
        },
      ),
    );
  }
}
