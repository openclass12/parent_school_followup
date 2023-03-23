import 'package:flutter/material.dart';
import 'package:parent_school_followup/theme.dart';
import 'home/home.dart';
import 'routes/routes.dart';
import 'demarage_application/splash_screen.dart';
import 'package:parent_school_followup/constant.dart';
import 'package:parent_school_followup/formluraire/connexion.dart';
import 'package:parent_school_followup/formluraire/inscrription.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

      initialRoute: ConnexionScren.routeName,
      routes: routes,
    );
  }
}
