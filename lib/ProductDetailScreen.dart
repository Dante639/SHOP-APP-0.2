import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ProductsProvider.dart';

class ProductDetailScreen extends StatelessWidget {
  //final String title;
  // final double price;
  // ProductDetailScreen(this.title, this.price,);

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).items.firstWhere((prod) => prod.id == productID);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedProduct.title,
          style: TextStyle(
            color: Colors.purpleAccent,
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
            fontSize: 23.2,
            fontFamily: 'Lato',
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
                fontSize: 23.2,
                fontFamily: 'Lato',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                  fontSize: 23.2,
                  fontFamily: 'Lato',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
