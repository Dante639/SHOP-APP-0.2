import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/Cart.dart' show Cart;
import 'package:app/CartItem.dart';
import 'package:app/Orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: TextStyle(
            color: Colors.yellowAccent,
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
            fontSize: 17.2,
            fontFamily: 'Lato',
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.black,
            margin: EdgeInsets.all(16.4),
            child: Padding(
              padding: EdgeInsets.all(8.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                      fontSize: 17.2,
                      fontFamily: 'Lato',
                    ),
                  ),
                  Spacer(),
                  //SizedBox(
                  // width: 10.2,
                  //),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmout.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3,
                        fontSize: 19.2,
                        fontFamily: 'Lato',
                      ),
                    ),
                    backgroundColor: Colors.black,
                    shadowColor: Colors.redAccent,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.iTems.values.toList(),
                        cart.totalAmout,
                      );
                      cart.clear();
                    },
                    child: Text(
                      'ORDER NOW!!!',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 4,
                        fontSize: 18.2,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
              itemCount: cart.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
