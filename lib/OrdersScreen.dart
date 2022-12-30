import 'package:flutter/material.dart';
import 'package:app/Orders.dart';
import 'package:provider/provider.dart';
import 'package:app/OrderssItemm.dart';
import 'AppDrawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Orders',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w900,
            letterSpacing: 4,
            fontSize: 25.2,
            fontFamily: 'Lato',
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderssItemm(
          ordersData.orders[i],
        ),
        itemCount: ordersData.orders.length,
      ),
    );
  }
}
