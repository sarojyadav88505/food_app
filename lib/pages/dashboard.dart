import 'package:flutter/material.dart';
import 'package:food_app/model/product.dart';
import 'package:food_app/pages/product_profile.dart';
import 'package:food_app/provider/product_provider.dart';
import 'package:food_app/widgets/drawer.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<ProductModel> products = [
    ProductModel(
        id: '1',
        name: 'Cheese Burger',
        price: 220,
        discount: true,
        sp: 210,
        description:
            "A hamburger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled.",
        image:
            'http://pngimg.com/uploads/burger_sandwich/burger_sandwich_PNG96787.png'),
    ProductModel(
      id: '2',
      name: 'Pizza',
      price: 550.00,
      discount: false,
      sp: 550,
      description:
          "Pizza is a savory dish of Italian origin consisting of a usually round, flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven. A small pizza is sometimes called a pizzetta.",
      image: 'http://pngimg.com/uploads/pizza/pizza_PNG44090.png',
    ),
    ProductModel(
      id: '3',
      name: 'Pani Puri',
      price: 150.00,
      discount: true,
      sp: 130,
      description:
          "Panipuri or fuchka or gupchup or golgappa is a type of snack that originated in the Indian subcontinent, and is one of the most common street foods in Pakistan, India, Nepal and Bangladesh.",
      image:
          'https://amatpathi.files.wordpress.com/2015/03/pesto_pani_puri.jpg',
    ),
    ProductModel(
      id: '4',
      name: 'Chowmein',
      price: 180.00,
      discount: true,
      sp: 160,
      description:
          "Chow mein are Chinese stir-fried noodles with vegetables and sometimes meat or tofu; the name is a romanization of the Taishanese chāu-mèn. The dish is popular throughout the Chinese diaspora and appears on the menus of most Chinese restaurants abroad. It is particularly popular in India, Nepal, the UK, and the US.",
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbKA7nNkBQ6rmIX0nobmS2a35j0Tc9rUcX6w&usqp=CAU',
    ),
    ProductModel(
      id: '5',
      name: 'Panir Masala',
      price: 250.00,
      discount: false,
      sp: 250,
      description:
          "Paneer tikka masala is an Indian dish of marinated paneer cheese served in a spiced gravy. It is a vegetarian alternative to chicken tikka masala.",
      image:
          'https://greatcurryrecipes.net/wp-content/uploads/2014/01/paneer.jpg',
    ),
    ProductModel(
      id: '6',
      name: 'Bada pav',
      price: 50.00,
      discount: false,
      sp: 50,
      description:
          "Vada pav, alternatively spelt wada pao, is a vegetarian fast food dish native to the state of Maharashtra. The dish consists of a deep fried potato dumpling placed inside a bread bun sliced almost in half through the middle. It is generally accompanied with one or more chutneys and a green chili pepper.",
      image: 'https://i.ndtvimg.com/i/2015-07/vada-pav_625x350_71436350861.jpg',
    ),
    ProductModel(
      id: '7',
      name: 'Cream Roll',
      price: 110.00,
      discount: true,
      sp: 90,
      description:
          "They are conical rolls of flaky dough that is like a cross between pie crust and puff pastry, and they're filled with sweetened cream. Sounds basic ",
      image: 'http://pngimg.com/uploads/ice_cream/small/ice_cream_PNG98156.png',
    ),
    ProductModel(
      id: '8',
      name: 'Butter',
      price: 110.00,
      discount: true,
      sp: 100,
      description:
          "Butter is a dairy product made from the fat and protein components of milk or cream. It is a semi-solid emulsion at room temperature, consisting of approximately 80% butterfat.",
      image: 'http://pngimg.com/uploads/butter/small/butter_PNG96705.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    ProductProvider product = Provider.of<ProductProvider>(context);
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Text(product.totalItems.toString()),
              IconButton(
                icon: Icon(Icons.shopping_cart_sharp),
                onPressed: () {
                  Navigator.pushNamed(context, 'cart');
                },
              )
            ],
          )
        ],
        title: Text("Hungry App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductProfileScreen(
                        product: products[index],
                      ),
                    ),
                  ),
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Image.network(products[index].image),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index].name,
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).accentColor),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                products[index].discount == false
                                    ? SizedBox()
                                    : Text(
                                        "Rs. " +
                                            products[index].price.toString(),
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.red),
                                        textScaleFactor: 1.2,
                                      ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Rs. " + products[index].sp.toString(),
                                  textScaleFactor: 1.2,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
