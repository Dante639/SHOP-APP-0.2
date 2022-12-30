import 'package:flutter/material.dart';
import 'ProductGrid.dart';
import 'package:app/Badge.dart';
import 'package:provider/provider.dart';
import 'package:app/Cart.dart';
import 'package:app/CartScreen.dart';
import 'package:app/AppDrawer.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverwievScreen extends StatefulWidget {
  @override
  State<ProductsOverwievScreen> createState() => _ProductsOverwievScreenState();
}

class _ProductsOverwievScreenState extends State<ProductsOverwievScreen> {
  var showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyShop',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
            fontSize: 23.2,
            fontFamily: 'Lato',
          ),
        ),
        actions: [
          PopupMenuButton(
            color: Colors.black87,
            onSelected: (FilterOptions selectValue) {
              setState(() {
                if (selectValue == FilterOptions.Favorites) {
                  showFavoritesOnly = true;
                } else {
                  showFavoritesOnly = false;
                }
              });
            },
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text(
                  'Only Favorites',
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    fontSize: 17.2,
                    fontFamily: 'Lato',
                  ),
                ),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text(
                  'Show All',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    fontSize: 17.2,
                    fontFamily: 'Lato',
                  ),
                ),
                value: FilterOptions.All,
              ),
            ],
            icon: Icon(
              Icons.more_vert_outlined,
              color: Colors.black87,
              size: 30.5,
            ),
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
              value: cartData.itemCount.toString(),
              child: ch!,
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart_checkout_outlined,
                color: Colors.indigoAccent,
                size: 30.5,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(showFavoritesOnly),
    );
  }
}
