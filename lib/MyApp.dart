import 'package:flutter/material.dart';
import 'package:groceryapp/Ui/Screens/CheckOutScreen.dart';
import 'package:groceryapp/Ui/Screens/HomeScreen.dart';
import 'package:groceryapp/Ui/Screens/OrderSummaryScreen.dart';
import 'package:groceryapp/Ui/Screens/ShoppingCartScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context) => HomeScreen(),
        '/shoppingCart': (context) => ShoppingCartScreen(),
        '/checkout': (context) => CheckOutScreen(),
        '/orderSummary': (context) => OrderSummaryScreen(),
      },
    );
  }
}
