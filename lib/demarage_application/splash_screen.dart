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
    Timer(const Duration(milliseconds: 6000), () {
          Navigator.pushReplacementNamed(context, ConnexionScren.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Animation_lancement(
                  delay: 2000,
                  child: Column(children: const [
                    Text(
                      "Parent",
                      style: TextStyle(
                          color: kPrimaryColorIcon,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.0),
                    ),
                    Text("SchoolFollow",
                        style: TextStyle(
                            color: kPrimaryColorIcon,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -2)),
                  ]),
                ),
                const Animation_lancement(
                    delay: 4000,
                    child: FlutterLogo(
                      size: 200,
                    )),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
