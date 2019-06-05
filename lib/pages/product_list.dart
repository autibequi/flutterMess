import 'package:flutter/material.dart';
import 'package:flutter_mess/pages/product_create.dart';

class ProductListPage extends StatelessWidget {
  final List<Map> product;
  final Function updateProduct;

  ProductListPage(this.product, this.updateProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
            key: Key(product[index]['title']),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(product[index]['image'])),
                  title: Text(product[index]['title']),
                  subtitle: Text('R\$ ${product[index]['price']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ProductCreatePage(
                            product: product[index],
                            index: index,
                            updateProduct: updateProduct);
                      }));
                    },
                  ),
                ),
                Divider()
              ],
            ));
      },
      itemCount: product.length,
    );
  }
}
