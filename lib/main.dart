import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'demarage_application/splash_screen.dart';
import 'package:parent_school_followup/constant.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kPrimarColor,
        primaryColor: kPrimarColor,
        
      ),
      initialRoute: SplahScreen.routeName,
      routes: routes,
    );
  }
}
