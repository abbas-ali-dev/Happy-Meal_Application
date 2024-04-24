import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class Welcome_Screen extends StatelessWidget {
  const Welcome_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset('assets/images/boy.png'),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'Order Now With Happy_Meal!',
              style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Text(
              'Order foods & get delivery with in a few minutes to your door',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),


          SizedBox(height: 80),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeScreen(),));
            },


            child: Container(
                width: 200,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFE13012),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
