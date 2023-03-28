import 'package:flutter/material.dart';

import 'package:parent_school_followup/constant.dart';

class Babilliard extends StatelessWidget {
  const Babilliard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
        Container(
          height: 200,
          decoration:const  BoxDecoration(
          gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0x665ac18e),
                    Color(0x995ac18e),
                    Color(0xcc5ac18e),
                    Color(0xff5ac18e),
                  ]),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)
            )
          ),
        ),
        Expanded(child: GridView.count(
         crossAxisCount: 2,

        ))
       ],
    );
  }
}