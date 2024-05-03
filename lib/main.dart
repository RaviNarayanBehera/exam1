import 'package:exam1/Cart_Page/cart_screen.dart';
import 'package:exam1/Home_Page/home_screen.dart';
import 'package:flutter/material.dart';

import 'Detail_Page/detail_screen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context)=>(HomePage()),
        '/detail' : (context)=>(DetailPage()),
        '/cart' : (context)=>(CartPage()),
      },
    );
  }
}
