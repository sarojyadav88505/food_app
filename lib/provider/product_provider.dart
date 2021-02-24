import 'package:flutter/material.dart';
import 'package:food_app/model/product.dart';

class ProductProvider extends ChangeNotifier {
  int _totalItems = 0;
  double _totalAmount = 0;

  List<ProductModel> _products = [];

  void addProduct(ProductModel product) {
    _totalItems++;
    _products.add(product);
    _totalAmount = _totalAmount + product.sp;
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    _totalItems--;
    _products.remove(product);
    _totalAmount = _totalAmount - product.sp;
    notifyListeners();
  }

  int get totalItems {
    return _totalItems;
  }

  double get totalAmount {
    return _totalAmount;
  }

  List<ProductModel> get products{
    return _products;
  }
}
