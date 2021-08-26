import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid({required this.showFavs});
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(
        context); //direct communication with provider chnanner for Products
    final products = showFavs ? productData.fevoritesItem : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
