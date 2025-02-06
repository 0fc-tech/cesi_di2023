import 'package:cesi_shop/model/product.dart';
import 'package:flutter/foundation.dart';

class Cart extends ChangeNotifier {
  final List<Product> products = [];

  void add(Product p) {
    products.add(p);
    notifyListeners();
  }

  void remove(Product p) {
    products.remove(p);
    notifyListeners();
  }

  void removeAll() {
    products.clear();
    notifyListeners();
  }

  int get qty => products.length;
  num get totalPrice =>
      products.fold(0, (prevPrice, product) => prevPrice + product.price);
}
