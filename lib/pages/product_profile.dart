import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductProfileScreen extends StatefulWidget {
  final ProductModel product;
  ProductProfileScreen({this.product});
  @override
  _ProductProfileScreenState createState() => _ProductProfileScreenState();
}

class _ProductProfileScreenState extends State<ProductProfileScreen> {
  int total = 1;
  @override
  Widget build(BuildContext context) {
    ProductProvider product = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Image.network(widget.product.image),
            ),
            ListTile(
              title: Text(
                widget.product.name,
                textScaleFactor: 1.5,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  widget.product.discount == false
                      ? SizedBox()
                      : Text(
                          "- Rs. " + widget.product.price.toString() + " off",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.red,
                              fontStyle: FontStyle.italic),
                        ),
                  Text(
                    "Rs. " + widget.product.sp.toString(),
                    textScaleFactor: 1.5,
                  ),
                  Text(widget.product.description),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          total--;
                          if (total <= 1) {
                            total = 1;
                          }
                          setState(() {});
                        },
                      ),
                      Text(
                        total.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle),
                        onPressed: () {
                          total++;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child: Text("ADD TO CART"),
                    onPressed: () {
                      product.addProduct(widget.product);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
