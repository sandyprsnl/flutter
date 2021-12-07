import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart';
import '../widgets/app_drawer.dart';
import '../providers/cart.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/products.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var isInit = true;
  var _isLoading = false;
  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProduct();       //given error becouse context is empty before the build
    // Future.delayed(Duration.zero).then((value) {              //add delay to conext is define.
    //   //add delay
    //   Provider.of<Products>(context, listen: false).fetchAndSetProduct();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Products>(context, listen: false)
          .fetchAndSetProduct()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Only fevorites'),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Show all'),
                      value: FilterOptions.All,
                    ),
                  ]),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
                child: ch!,
                value: cart.itemCount.toString(),
                color: Colors.red),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(
              showFavs: _showOnlyFavorites,
            ),
    );
  }
}
