import 'package:flutter/material.dart';
import 'package:happy_meal/ItemScreen1.dart';
import 'package:happy_meal/ItemScreen2.dart';
import 'package:happy_meal/ItemScreen3.dart';


class HomeScreen extends StatelessWidget {

  List<Widget> screen = [
    ItemScreen1(),
    ItemScreen2(),
    ItemScreen3(),
    ItemScreen3(),
  ];

  List foods = [
    "Burger",
    "Pizza",
    "Snacks",
    "Water",
  ];


  List foods2 = [
    "Chicken Burger",
    "Cheese Pizza",
  ];


  List<Color> bgColors = [
    Color(0xFFFBDCDA),
    Color(0xFFD4EEF3),
    Color(0xFFFAE6D5),
    Color(0xFFEFCFE7),
  ];

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Delivery to...', style: TextStyle(fontSize: 20)),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.red,),
                          Text('Lahore, Punjab, Pakistan', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_drop_down),
                        ],
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('assets/images/me.jpg'),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      Positioned(
                        left: 40,
                          child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                            color: Colors.red,
                            shape: BoxShape.circle,
                        ),
                      )
                      )
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0xABF5F5F5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search your meal here...",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search,),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.filter_list,
                    color: Colors.white,
                    size: 20,)
                  ),
                ),
              ],
            ),


            SizedBox(height: 28,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5,),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/banner.jpg'),
              ),
            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Categories', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ItemScreen2(),));
                }, child: Text('See All', style: TextStyle(color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),))
              ],
            ),
            ),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: foods.length,
                itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: EdgeInsets.only(left: 8),
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: bgColors[index],
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: InkWell(

                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => screen[index],));
                    },

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/${foods[index]}.png",
                        height: 80, width: 80,),
                    
                        Text(foods[index],
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                );
              },),
            ),

            Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ItemScreen3(),));
                }, child: Text('See All', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.blue),),)
              ],
            ),
            ),

            SizedBox(height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: foods2.length,
              itemBuilder: (context, index) {


              return InkWell(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => screen[index],));
                  },

                child: Container(
                width: MediaQuery.of(context).size.width/1.4,
                margin: EdgeInsets.only(left: 15, right: 5, bottom: 5, top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset('assets/images/${foods2[index]}.jpg',
                      height: 120,
                        width: MediaQuery.of(context).size.width/1.4,
                        fit: BoxFit.cover,
                      ),
                    ),


                    Padding(padding: EdgeInsets.only(left: 10, ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(foods2[index], style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),

                            SizedBox(height: 5,),
                            Text('Fast Foods', style: TextStyle(fontSize: 16, color: Colors.black,),),

                            SizedBox(height: 5,),
                            Row(children: [
                              Icon(Icons.star,
                              color: Colors.red,
                              size: 20,),
                              SizedBox(width: 2,),
                              Text('4.7', style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                            ),
                          ],
                        )
                      ],
                    ),),

                  ],
                ),
              ),
              );
            },
            ),
            ),

            SizedBox(height: 50),
          ], // Children
        ),
      ),
    );
  }
}




/*
class PizzaCart extends StatelessWidget {
  const PizzaCart({super.key});

  final String itemName;
  final String imagePath;

  const PizzaCart({this.itemName, this.imagePath})
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ItemScreen1(
          itemName: itemName,
          imagePath: imagePath,
        ),))
      },
    );
  }
}
*/










































