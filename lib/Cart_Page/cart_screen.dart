import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../List.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'CartScreen Page',
          style: TextStyle(
              letterSpacing: 1.5,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              cartitems.length,
              (index) => cartlist(
                index: index,
                img: cartitems[index]['img'],
                name: cartitems[index]['name'],
                color: cartitems[index]['color'],
                qty: cartitems[index]['qty'],
                price: cartitems[index]['price'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Row cartlist(
    {required String img,
    required String name,
    required int index,
    required String color,
    required int qty,
    required String price}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        margin: EdgeInsets.all(8),
        height: 210,
        width: 400,
        decoration: const BoxDecoration(
          color: Colors.black,

          boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 1.5)],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 210,
              width: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.fill
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              height: 230,
              width: 165,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2,),
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(height: 3),
                  Text(
                    color,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 3,),
                  Text(
                    qty.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 3,),
                  Text(
                    price+'/-',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(){
                  cartitems.removeAt(index);
                }
              },
              child: Container(
                  height: 210,
                  width: 52,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: Icon(Icons.delete,color: Colors.white,)),
            ),
          ],
        ),
      ),
    ],
  );
}

int index = 0;
int count = 0;
int qty = 0;
int total = 0;
int amt = 0;
