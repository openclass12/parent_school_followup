import 'package:flutter/material.dart';


class ScrollPageScreen extends StatefulWidget {
  static String routeName = '/ScrollPageScreen';
  

  @override
  State<ScrollPageScreen> createState() => _ScrollPageScreenState();
}

class _ScrollPageScreenState extends State<ScrollPageScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("page scroll") ,
        
      ),
    );
  }
}