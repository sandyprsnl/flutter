import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/orders.dart';
import './providers/cart.dart';
import 'screens/products_overview_screen.dart';
import './providers/products.dart';
import './screens/products_details.dart';
import '/screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        home: ProductsOverviewScreen(),
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        routes: {
          ProductDetailScreen.routName: (ctx) => ProductDetailScreen(),
          CartScreen.routName: (ctx) => CartScreen(),
          OrdersScreen.routName: (ctx) => OrdersScreen(),
          UserProductScreen.routName: (ctx) => UserProductScreen(),
        },
      ),
    ));
