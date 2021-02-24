import 'package:flutter/material.dart';
import 'package:food_app/provider/product_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    ProductProvider product = Provider.of<ProductProvider>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                "items(" + product.totalItems.toString() + ")",
                textScaleFactor: 1.2,
              ),
            ),
            Container(
              child: Text(
                "Total: " + product.totalAmount.toString(),
                textScaleFactor: 1.2,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart"),
      ),
      body: product.totalItems == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/oops.png'),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset('images/cart.png'),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "No items in basket,\nPlease Buy Something...!",
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      RaisedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, 'Productprofile');
                        },
                        icon: Icon(Icons.shopping_bag),
                        label: Text(
                          "Click To Buy",
                        ),
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: product.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Image.network(
                                      product.products[index].image),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.products[index].name + " x 1",
                                        textScaleFactor: 1.3,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Rs. " +
                                          product.products[index].sp
                                              .toString()),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    product
                                        .removeProduct(product.products[index]);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
    );
  }
}
