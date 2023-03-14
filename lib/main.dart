import 'package:flutter/material.dart';
import 'package:parent_school_followup/theme.dart';
import 'routes/routes.dart';
import 'demarage_application/splash_screen.dart';
import 'package:parent_school_followup/constant.dart';
import 'package:parent_school_followup/formluraire/connexion.dart';
import 'package:parent_school_followup/formluraire/inscrription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: InscirptionScreen.routeName,
      routes: routes,
    );
  }
}
