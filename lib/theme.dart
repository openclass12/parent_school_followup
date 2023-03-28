import 'package:flutter/material.dart';
import 'package:parent_school_followup/constant.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: kPrimarColor,
      primaryColor: kPrimarColor,
      appBarTheme: appbardefault(),
      inputDecorationTheme: inputdecaration(),
      iconTheme: const IconThemeData(
        color: kPrimaryColorIcon,
      ));
}

AppBarTheme appbardefault() {
  return const AppBarTheme(
    elevation: 0,
    backgroundColor: kTexColor,
    iconTheme: IconThemeData(),
    centerTitle: true,
  );
}

InputDecorationTheme inputdecaration() {
  return const  InputDecorationTheme(
    
    contentPadding: EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 20,
    ),
    
   
    
  );
}
