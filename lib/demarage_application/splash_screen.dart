import 'package:flutter/material.dart';
import '../animation/animation_lancement.dart';
import 'package:parent_school_followup/constant.dart';
import '../routes/routes.dart';
class SplahScreen extends StatelessWidget {
  //definition de la routes
  static String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: SingleChildScrollView(
             child: Center(
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                     Animation_lancement(delay:600 ,
                   child:Column(
                    children: const[
                      Text("Parent",
                      style:TextStyle(color: kPrimaryColorIcon,fontSize: 30,fontWeight: FontWeight.w700,letterSpacing: 2.0) ,),
                      Text("SchoolFollow",style: TextStyle(color: kPrimaryColorIcon,fontSize: 28,fontWeight: FontWeight.w700,letterSpacing: -2)),
                    ]),
                   ),
        
                   
                  const Animation_lancement(delay:900 ,
                   child:FlutterLogo(
                    size: 200,
                   )
                    
                   ),],),
             ),
          ),
        ),
    );
  }
}
