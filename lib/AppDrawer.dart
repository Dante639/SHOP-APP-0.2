import 'package:flutter/material.dart';
import 'package:app/OrdersScreen.dart';
import 'package:app/UserProductsScreen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Thank You'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.shop_two_outlined,
              color: Colors.black87,
              size: 26.5,
            ),
            title: Text(
              'Shop',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
                fontSize: 22.2,
                fontFamily: 'Lato',
              ),
            ),
            onTap: (){Navigator.of(context).pushReplacementNamed('/');},
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.payment_outlined,
              color: Colors.black87,
              size: 26.5,
            ),
            title: Text(
              'Your Orders',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
                fontSize: 22.2,
                fontFamily: 'Lato',
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.mode_edit_outlined,
              color: Colors.black87,
              size: 26.5,
            ),
            title: Text(
              'Manage Products',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
                fontSize: 22.2,
                fontFamily: 'Lato',
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
