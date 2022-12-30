import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> iTems = {};

  Map<String, CartItem> get items {
    return {...iTems};
  }

  double get totalAmout {
    var totsl = 0.0;
    iTems.forEach((key, CartItem) {
      totsl += CartItem.price * CartItem.quantity;
    });
    return totsl;
  }

  int get itemCount {
    return iTems.length;
  }

  void addItems(String productID, double price, String title) {
    if (iTems.containsKey(productID)) {
      iTems.update(
          productID,
              (existingCartItem) =>
              CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      iTems.putIfAbsent(
        productID,
            () =>
            CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1,
            ),
      );
    }
    notifyListeners();
  }

  void removeSingleItem(String productID) {
    iTems.remove(productID);
    notifyListeners();
  }

  void removeItem(String productID) {
    if (!iTems.containsKey(productID)) {
      return;
    }
    if (iTems[productID]!.quantity > 1) {
      iTems.update(productID, (existtingCartItem) =>
          CartItem(id: existtingCartItem.id,
            title: existtingCartItem.title,
            quantity: existtingCartItem.quantity-1,
            price: existtingCartItem.price,));
    }else{
      iTems.remove(productID);
    }
    notifyListeners();
  }

  void clear() {
    iTems = {};
    notifyListeners();
  }
}
