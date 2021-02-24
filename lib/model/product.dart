import 'package:flutter/material.dart';

class ProductModel {
  String id;
  String name;
  double price;
  bool discount;
  double sp;
  String description;
  String image;

  ProductModel({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.discount,
    @required this.sp,
    this.description,
    @required this.image,
  });
}
