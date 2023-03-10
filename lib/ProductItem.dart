import 'package:flutter/material.dart';
import 'package:app/ProductDetailScreen.dart';
import 'package:provider/provider.dart';
import 'package:app/Product.dart';
import 'package:app/Cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  //ProductItem(
  //  this.id,
  //  this.title,
  //   this.imageUrl,
  // );

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              icon: Icon(
                product.isFavorite
                    ? Icons.favorite_outlined
                    : Icons.favorite_border_outlined,
                color: Colors.redAccent,
                size: 26.5,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.title,
            style: TextStyle(
              color: Colors.purpleAccent,
              fontWeight: FontWeight.w900,
              letterSpacing: 3,
              fontSize: 23.2,
              fontFamily: 'Lato',
            ),
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart_checkout_outlined,
              color: Colors.pink,
              size: 26.5,
            ),
            onPressed: () {
              cart.addItems(
                product.id,
                product.price,
                product.title,
              );
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Added item to cart',textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                      fontSize: 23.2,
                      fontFamily: 'Lato',
                    ),
                  ),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(label: 'UNDO', onPressed: (){
                    cart.removeSingleItem(product.id);
                  },textColor: Colors.purple,),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
