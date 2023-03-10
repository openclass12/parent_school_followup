import 'package:flutter/material.dart';
import 'package:parent_school_followup/theme.dart';
import '../animation/animation_lancement.dart';
import 'package:parent_school_followup/constant.dart';

import '../widget/button.dart';
//import 'package:parent_school_followup/size_config.dart';

class ResetPassword extends StatefulWidget {
  static String routeName = '/Resetpasswod';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
          
        ),
      ),
    );
  }
}
