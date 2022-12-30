import 'package:app/UserProductItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/ProductsProvider.dart';
import 'AppDrawer.dart';
import 'package:app/EditProductsScreen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Products',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
            fontSize: 23.2,
            fontFamily: 'Lato',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductsScreen.routeName);
            },
            color: Colors.white,
            icon: Icon(
              Icons.add_circle_outlined,
              color: Colors.black87,
              size: 26.5,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(7),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                productData.items[i].id,
                productData.items[i].title,
                productData.items[i].imageUrl,
              ),
              Divider(),
            ],
          ),
          itemCount: productData.items.length,
        ),
      ),
      backgroundColor: Colors.black87,
      drawer: AppDrawer(),
    );
  }
}
