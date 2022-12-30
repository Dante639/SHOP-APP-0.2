import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/ProductsOverwievScreen.dart';
import 'package:app/ProductDetailScreen.dart';
import 'package:app/ProductsProvider.dart';
import 'package:app/Cart.dart';
import 'CartScreen.dart';
import 'package:app/Orders.dart';
import 'package:app/OrdersScreen.dart';
import 'package:app/UserProductsScreen.dart';
import 'EditProductsScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:  [
        ChangeNotifierProvider(
        create: (ctx) => Products(),),
      ChangeNotifierProvider(
        create: (ctx) => Cart(),),
      ChangeNotifierProvider(create: (ctx) => Orders(),)
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          backgroundColor: Colors.black,
          canvasColor: Colors.purpleAccent,
          primarySwatch: Colors.purple,
          fontFamily: 'Lato',
        ),
        home: ProductsOverwievScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName:(ctx) => OrdersScreen(),
          UserProductsScreen.routeName:(ctx) => UserProductsScreen(),
          EditProductsScreen.routeName:(ctx) => EditProductsScreen(),
        },
      ),
    );
  }
}
