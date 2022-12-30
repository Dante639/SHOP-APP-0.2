import 'package:flutter/material.dart';
import 'package:app/Orders.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrderssItemm extends StatefulWidget {
  final OrdersItem ordErs;

  OrderssItemm(this.ordErs);

  @override
  State<OrderssItemm> createState() => _OrderssItemmState();
}

class _OrderssItemmState extends State<OrderssItemm> {
  var expanded = false;

  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '\$${widget.ordErs.amout}',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w900,
                letterSpacing: 4,
                fontSize: 25.2,
                fontFamily: 'Lato',
              ),
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy/hh:mm').format(widget.ordErs.dateTime),
              style: TextStyle(
                color: Colors.purpleAccent,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
                fontSize: 25.2,
                fontFamily: 'Lato',
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                expanded
                    ? Icons.expand_less_outlined
                    : Icons.expand_more_outlined,
                color: Colors.red,
                size: 26.5,
              ),
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
            ),
          ),
          if (expanded)
            Container(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
              height: min(widget.ordErs.products.length * 20.2 + 70, 140),
              child: ListView(
                children: widget.ordErs.products
                    .map(
                      (prod) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            prod.title,
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 3,
                              fontSize: 25.2,
                              fontFamily: 'Lato',
                            ),
                          ),
                          Text(
                            '${prod.quantity}x \$${prod.price}',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 3,
                              fontSize: 25.2,
                              fontFamily: 'Lato',
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
