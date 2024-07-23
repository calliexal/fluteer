import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/cart_page.dart';
import 'pages/profile_page.dart';
import 'pages/order_page.dart';
import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brly Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: sanguineBrown,
          secondary: whiteRock,
        ),
        buttonTheme: ButtonThemeData(buttonColor: sanguineBrown),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: sanguineBrown,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: sanguineBrown),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: sanguineBrown),
          ),
          labelStyle: TextStyle(color: sanguineBrown),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/cart': (context) => CartPage(cartItems: [], orders: []),
        '/profile': (context) => ProfilePage(orders: []),
        '/orders': (context) => OrderPage(orders: []),
      },
    );
  }
}