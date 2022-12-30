import 'package:flutter/foundation.dart';
import 'package:app/Cart.dart';

class OrdersItem {
  final String id;
  final double amout;
  final List<CartItem> products;
  final DateTime dateTime;

  OrdersItem({
    required this.id,
    required this.amout,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrdersItem> orders = [];

  List<OrdersItem> get oRderS {
    return [...orders];
  }

  void addOrder(List<CartItem> cartProduct, double total) {
    orders.insert(
      0,
      OrdersItem(
        id: DateTime.now().toString(),
        amout: total,
        products: cartProduct,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
