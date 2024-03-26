import 'package:flutter/material.dart';
import 'package:happy_meal/controller/provider.dart';
import 'package:provider/provider.dart';
import 'Welcome_Screen.dart';

void main(){
  runApp(
      ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: const happymeal(),
      ),
      );
}

class happymeal extends StatefulWidget {
  const happymeal({super.key});

  @override
  State<happymeal> createState() => _happymealState();
}

class _happymealState extends State<happymeal> {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome_Screen(),
    );
  }
}
