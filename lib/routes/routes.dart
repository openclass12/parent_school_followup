import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../demarage_application/scroll_pageview.dart';
import '../demarage_application/splash_screen.dart';
import '../formluraire/connexion.dart';
import '../formluraire/resetpassword.dart';
import '../formluraire/inscrription.dart';
import '../formluraire/validation.dart';
import '../home/home.dart';


Map<String, WidgetBuilder> routes={
  //definition de toutes les routes
  SplahScreen.routeName: (context)=> SplahScreen(),
  ScrollPageScreen.routeName: (context)=> ScrollPageScreen(),
  ConnexionScren.routeName: (context)=> ConnexionScren(),
  ResetPassword.routeName:(context) => ResetPassword(),
  InscirptionScreen.routeName:(context) => InscirptionScreen(),
  ValidationReset.routeName:(context)=> ValidationReset(),
  HomeNavigation.routeName:(context) =>  HomeNavigation(),
};