import 'package:flutter/material.dart';
import 'package:parent_school_followup/constant.dart';

class Presentation extends StatefulWidget {
  const Presentation({super.key});

  @override
  State<Presentation> createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kPrimaryColorIcon,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: kPrimaryColorIcon,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            child:Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children:const [
                            Text("Nom etudiant:", style:TextStyle(color:kTextBlockColor, fontSize: 15,fontWeight: FontWeight.w700)),
                            Text("Gamo freddy", style: TextStyle(color: kTexColor, fontSize: 20,fontWeight: FontWeight.w700),),
                        ]),
                      const CircleAvatar(
                        backgroundImage: AssetImage("image/photo_etudiant/photo1.JPG"),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("anne scolaire",style:TextStyle(color: kTexColor, fontSize: 20,fontWeight: FontWeight.w700)),
                  ),
            
                ],
              ),
            )
          ),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: kTexColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 3),
                    topRight: Radius.circular(kDefaultPadding * 3))),
          ))
        ],
      ),
    );
  }
}
