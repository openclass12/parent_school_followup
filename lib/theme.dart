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
  return InputDecorationTheme(
    
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 20,
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: kTextBlockColor),
        gapPadding: 5),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: const BorderSide(color: kTextBlockColor),
      gapPadding: 5,),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: const BorderSide(color: kErrorBorderColor),
      gapPadding: 5,),
     focusedErrorBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: const BorderSide(color: kErrorBorderColor),
      gapPadding: 5,),
  );
}
