import 'package:flutter/material.dart';
import 'package:flutter_mess/pages/product_create.dart';

class ProductListPage extends StatelessWidget {
  final List<Map> product;

  ProductListPage(this.product);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image.asset(product[index]['image']),
          title: Text(product[index]['title']),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return ProductCreatePage(product: product[index]);
              }));
            },
          ),
        );
      },
      itemCount: product.length,
    );
  }
}
