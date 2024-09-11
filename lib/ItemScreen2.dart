import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_meal/AddToCart2.dart';
import 'package:happy_meal/Cart_page.dart';
import 'package:happy_meal/controller/provider.dart';
import 'package:provider/provider.dart';

import 'HomeScreen.dart';

class ItemScreen2 extends StatelessWidget {
  const ItemScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,),
        ),
        title: Text('Cheese Pizza', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)),
          
          
          actions: [
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                int itemCount = cartProvider.cartItems.length;
                return Stack(
                  alignment: Alignment.topRight,
                  children: [


                    IconButton(
                      icon: Icon(Icons.shopping_cart),
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
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    )
                        : SizedBox.shrink(),
                  ],
                );
              },
            ),
          ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text('Mized Pizza With Beef, Chilli & Cheese', style: TextStyle(fontSize: 17,),
            textAlign: TextAlign.center,
            ),

            SizedBox(height: 8, ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.red, size: 22,),
                SizedBox(width: 2,),
                Text('4.7', style: TextStyle(fontSize: 17),)
              ],
            ),
            Padding(padding: EdgeInsets.all(25),
            child: Image.asset('assets/images/Pizza.png',),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Calories", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text('120', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                  ],
                ),
                Container(
                  height: 30,
                  width: 2,
                ),
                Column(
                  children: [
                    Text('Volume', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text('12 inch', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                  ],
                )
              ],
            ),

            SizedBox(height: 40,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Order', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text('Place', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),

                Column(
                  children: [
                    Text('Delivery', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                    Text('Express', style: TextStyle(fontSize: 17, color: Colors.green, fontWeight: FontWeight.bold),),
                  ],
                ),

                Column(
                  children: [
                    Text('"Price"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green,)),
                    Text('1150/-rs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red,), ),
                  ],
                )
              ],
            )),
            
          ],
        ),
      ),

      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddToCart2(),));
        },
        child: Container(
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('Add to Cart', style: TextStyle( fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,)),
            SizedBox(width: 8,),
            Icon(Icons.add_circle_outline_outlined, color: Colors.white),
          ],

          ),
        ),
      ),
    );
  }
}










