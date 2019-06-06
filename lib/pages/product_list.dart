import 'package:flutter/material.dart';
import 'package:flutter_mess/models/product.dart';
import 'package:flutter_mess/pages/product_create.dart';
import 'package:flutter_mess/scoped-models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductModel>(
      builder: (BuildContext context, Widget child, ProductModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(model.products[index].title),
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.startToEnd) {
                    // TODO: Delete Item
                    print('should be deleting something here');
                  }
                },
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(model.products[index].image)),
                      title: Text(model.products[index].title),
                      subtitle: Text('R\$ ${model.products[index].price}'),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return ProductCreatePage(
                                product: model.products[index],
                                index: index,
                                updateProduct: model.updateProduct);
                          }));
                        },
                      ),
                    ),
                    Divider()
                  ],
                ));
          },
          itemCount: model.products.length,
        );
      },
    );
  }
}
