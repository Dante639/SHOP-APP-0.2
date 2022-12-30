import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ProductItem.dart';
import 'package:app/ProductsProvider.dart';


class ProductsGrid extends StatelessWidget {
  final bool onlyFans;

  ProductsGrid(this.onlyFans);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = onlyFans ? productsData.favoritesitemS : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(11.5),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(  //ChangeNotifierProvider(   its alternative Syntaxes
                                                              // create: (c) =>products[i],
        value: products[i],
        child: ProductItem(
          //products[i].id,
          //products[i].title,
          //products[i].imageUrl,
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
    );
  }
}
