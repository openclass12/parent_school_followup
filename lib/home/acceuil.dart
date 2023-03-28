import 'package:flutter/material.dart';

//import '../routes/routes.dart';
//import '../demarage_application/splash_screen.dart';
import 'package:parent_school_followup/constant.dart';

import '../formluraire/validation.dart';
import 'page acceuil/class.dart';

late bool test = true;

class AceuilScrenn extends StatelessWidget {
  AceuilScrenn({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;
  final List<Map<String, dynamic>> list = [];

  void ajouter() {
    list.add(data);
  }

  Widget build(BuildContext context) {
 

    return Scaffold(
      
      body: Center(
        child: Column(
          children: [
            Center(child: Text(data['Nom'])),
            Center(child: Text(data['filiere'])),
            Center(child: Text(data['niveau'].toString())),
            Center(child: Text(data['pension'].toString())),

            
          ],
        ),
      ),
    );
  }
}
 