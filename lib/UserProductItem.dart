import 'package:flutter/material.dart';
import 'package:app/EditProductsScreen.dart';
import 'package:provider/provider.dart';
import 'package:app/ProductsProvider.dart';


class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;


  UserProductItem(
    this.id,
    this.title,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.w900,
          letterSpacing: 3,
          fontSize: 27.2,
          fontFamily: 'Lato',
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl), //or you can use AssetImage
      ),
      trailing: Container(
        width: 89,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.mode_edit_outline,
                color: Colors.pink,
                size: 26.5,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  EditProductsScreen.routeName,
                  arguments: id,
                );
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(
                Icons.delete_forever_outlined,
                color: Colors.red,
                size: 26.5,
              ),
              onPressed: () {
                Provider.of<Products>(context,listen: false).deleteProduct(id);
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
