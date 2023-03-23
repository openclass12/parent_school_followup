import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parent_school_followup/demarage_application/scroll_pageview.dart';
import 'package:parent_school_followup/formluraire/connexion.dart';
import '../animation/animation_lancement.dart';
import 'package:parent_school_followup/constant.dart';

class SplahScreen extends StatefulWidget {
  static String routeName = 'SplashScren';

  @override
  State<SplahScreen> createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 10000), () {
      Navigator.pushReplacementNamed(context, ConnexionScren.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTexColor,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Animation_lancement(
                child: FlutterLogo(
                  size: 150,
                  textColor: kPrimaryColorIcon,
                ),
                delay: 500),
            Row(
              children: [
                Column(
                  children: const [
                    Text(
                      "Suivie Scolaire",
                      style: TextStyle(
                          color: kPrimaryColorIcon,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "parentale",
                      style: TextStyle(
                          color: kPrimaryColorIcon,
                          fontSize: 15,
                          fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                const Text("Suivez votre \n enfant", style: TextStyle(color: kPrimaryColorIcon,fontSize: 25,fontWeight: FontWeight.w700),),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
