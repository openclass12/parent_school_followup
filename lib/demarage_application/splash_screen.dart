import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parent_school_followup/demarage_application/scroll_pageview.dart';
import 'package:parent_school_followup/formluraire/connexion.dart';
import '../animation/animation_lancement.dart';
import 'package:parent_school_followup/constant.dart';

import '../formluraire/loginscreen.dart';

class SplahScreen extends StatefulWidget {
  static String routeName = 'SplashScren';

  @override
  State<SplahScreen> createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 6000), () {
      Navigator.pushReplacementNamed(context, Loginscreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTexColor,
      body: Container(
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Animation_lancement(
                child: Image(image: AssetImage("image/demarrage/logo.jpg")),
                delay: 600),
              ],
            )
          ),
        ),
    );
  }
}
