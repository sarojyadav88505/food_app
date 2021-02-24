import 'package:flutter/material.dart';
import 'package:food_app/pages/Splash.dart';
import 'package:food_app/pages/cart.dart';
import 'package:food_app/pages/dashboard.dart';
import 'package:food_app/pages/login.dart';
import 'package:food_app/pages/product_profile.dart';
import 'package:food_app/pages/register.dart';
import 'package:food_app/provider/darkmode.dart';
import 'package:food_app/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductProvider()),
      ChangeNotifierProvider(create: (context) => DarkMode())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DarkMode darkMode = Provider.of<DarkMode>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: darkMode.flag == true ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => SplashScreen(),
        'login': (context) => LoginScreen(),
        'Register': (context) => RegisterScreen(),
        'dashboard': (context) => DashboardScreen(),
        'Productprofile': (context) => ProductProfileScreen(),
        'cart': (context) => CartScreen(),
      },
    );
  }
}
