import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/edit_product_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import '../providers/products.dart';

class UserProductScreen extends StatelessWidget {
  static const routName = '/user-products';
  const UserProductScreen({Key? key}) : super(key: key);
  Future<void> _refreshProduct(BuildContext ctx) async {
    await Provider.of<Products>(ctx, listen: false).fetchAndSetProduct();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routName,
                    arguments: {'id': '', 'updateProduct': false});
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProduct(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productData.items.length,
            itemBuilder: (ctx, i) => Column(
              children: [
                UserProductItem(
                  id: productData.items[i].id,
                  title: productData.items[i].title,
                  imageUrl: productData.items[i].imageUrl,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
