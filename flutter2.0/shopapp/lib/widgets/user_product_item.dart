// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem(
      {Key? key, required this.id, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routName,
                    arguments: {'id': id, 'updateProduct': true});
              },
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () async {
                try {
                  await Provider.of<Products>(context, listen: false)
                      .deleteProduct(id);
                } catch (error) {
                  // await showDialog<Null>(
                  //     context: context,
                  //     builder: (context) => AlertDialog(
                  //           title: Text('An Error occured!'),
                  //           content: Text('Somthing went Wrong'),
                  //           actions: [
                  //             TextButton(
                  //                 onPressed: () {
                  //                   Navigator.of(context).pop();
                  //                 },
                  //                 child: Text('OK'))
                  //           ],
                  //         ));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    'Deleting Failed!',
                    textAlign: TextAlign.center,
                  )));
                }
              },
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
