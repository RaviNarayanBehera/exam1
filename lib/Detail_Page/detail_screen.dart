import 'package:exam1/Global.dart';
import 'package:exam1/List.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Page',
          style: TextStyle(
              letterSpacing: 1.5,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 28),
        ),
      ),
      body: Column(
        children: [
          details(
            img: itemslist[selectedindex]['img'],
            name: itemslist[selectedindex]['name'],
            price: itemslist[selectedindex]['price'],
            color: itemslist[selectedindex]['color'],
            des: itemslist[selectedindex]['des'],
          ),
          GestureDetector(
            onTap: ()  {
              bool a = false;
              int index =0;
              for(int i=0; i<cartitems.length; i++)
              {
                if(cartitems[i]['name']==itemslist[selectedindex]['name'])
                {
                  a = true;
                  index=i;
                }
              }
              if(a)
              {
                cartitems[index]['qty']++;
              }
              else{
                cartitems.add(itemslist[selectedindex]);
              }

              Navigator.of(context).pushNamed('/cart');
            },
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: const Center(
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container details({
    required String img,
    required String name,
    required String price,
    required String color,
    required String des,
  }) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.all(7),
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(color: Colors.black, spreadRadius: 2, blurRadius: 2)
              ],
              image: DecorationImage(
                image: AssetImage(img),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 420,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 3,
                    ),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Model    :',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      TextSpan(
                        text: "  " + name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Price      :',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      TextSpan(
                        text: "  " + 'Rs. ' + price + '/-',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Color      :  ',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      TextSpan(
                        text: color,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Descprition  :  ',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      TextSpan(
                        text: des,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
