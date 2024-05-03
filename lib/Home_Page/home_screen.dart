import 'package:exam1/Global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../List.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '\$hoes',
          style: TextStyle(
              letterSpacing: 1.5,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 35),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.menu_open,
            size: 40,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/cart');
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.shopping_cart,
                size: 35,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/banner.jpg'),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '  Popular 🔥',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  )),
              Column(
                children: [
                  ...List.generate(
                      itemslist.length,
                      (index) => GestureDetector(
                        onTap:() {
                          selectedindex = index;
                          Navigator.of(context).pushNamed('/detail');
                        },
                        child: itemList(
                            img: itemslist[index]['img'],
                            price: itemslist[index]['price']),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container itemList({required String img, required String price}) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Wrap(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 220,
                width: 200,
                decoration: BoxDecoration(
                  border: const Border(
                      top: BorderSide(color: Colors.black, width: 3),
                      right: BorderSide(color: Colors.black, width: 3),
                      left: BorderSide(color: Colors.black, width: 3)),
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
