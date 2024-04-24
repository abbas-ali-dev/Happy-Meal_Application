


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_meal/AddToCart.dart';
import 'package:happy_meal/Cart_page.dart';
import 'package:happy_meal/controller/provider.dart';
import 'package:happy_meal/user_detail.dart';
import 'package:provider/provider.dart';



class AddToCart3 extends StatefulWidget {
  const AddToCart3({super.key});

  @override
  State<AddToCart3> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart3> {

  int items = 0;
  int price = 250;
  int total = 0;
  int itemCount = 0;


  void add(){
    setState(() {
      items = items + 1;
    });
  }

  void minus(){
    setState(() {
      items = items - 1;
    });
  }

  void result(){
    setState(() {
      total = items*price;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Place your Order...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,)),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              int itemCount = cartProvider.cartItems.length;
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ),
                      );
                    },
                  ),
                  itemCount > 0
                      ? Positioned(
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 10,
                      child: Text(
                        itemCount.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                      : const SizedBox.shrink(),
                ],
              );
            },
          ),
        ],
      ),

      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Image.asset('assets/images/Snacks.png', width: 250,),
            const SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      minus();
                    },

                    child: const Icon(CupertinoIcons.minus_circle,color: Colors.red, size: 40,)),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('$items', style: const TextStyle(fontSize: 30,)),
                ),
                TextButton(
                    onPressed: () {
                      add();
                      result();
                      // Add your item to the cart
                      final cartProvider = Provider.of<CartProvider>(context, listen: false);
                      cartProvider.addToCart(CartItem(itemName: 'Snack Box x1', price: 250.0));

                      // Show a snackbar or navigate to another screen
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Item added to cart', ),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Icon(Icons.add_circle_outline, color: Colors.green, size: 40,)
                ),
              ],
            ),

            Column(
              children: [
                const SizedBox(height: 30,),
                Container(

                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Click (+) for Tasty Meal', style: TextStyle(fontSize: 30, color: Colors.white)),
                  ),
                ),
              ],
            ),

            Column(
              children: [
                const SizedBox(height: 50,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Your Total Price is' , style: TextStyle(fontSize: 30,)),
                      Text(' $total/-rs', style: const TextStyle(fontSize: 30, color: Colors.red,)),

                    ]
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}












