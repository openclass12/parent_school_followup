import 'package:flutter/material.dart';

//import '../routes/routes.dart';
//import '../demarage_application/splash_screen.dart';
import 'package:parent_school_followup/constant.dart';

import 'page acceuil/presentation.dart';

class AceuilScrenn extends StatefulWidget {
  const AceuilScrenn({super.key});

  @override
  State<AceuilScrenn> createState() => _AceuilScrennState();
}

class _AceuilScrennState extends State<AceuilScrenn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTexColor,
      appBar: AppBar(
        title: const Text(
          "SchoolParent",
          style: TextStyle(
              color: kPrimaryColorIcon,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: -4),
        ),
        centerTitle: false,
        actions: const [Icon(Icons.bookmark)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: InkWell(
                onTap: (){
                   Navigator.push(
                        context, MaterialPageRoute(builder: (context)=>Presentation()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradientColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: MediaQuery.of(context).size.width * 0.15,
                          left: 0,
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.15
                            ,
                            backgroundImage:const AssetImage('image/photo_etudiant/photo1.JPG'),
                          
                          )),
                      Positioned(
                        top: 2,
                        right: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Column(
                          children: [
                            ListTileProfile(firstTilte: "matricule", subTitle: "IUCQ20214", onPresse: () {}, iconsprofile: Icons.key,),
                            const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Divider(
                                  color: Colors.yellow,
                                  thickness: 1,
                                ),
                              ),
                            ListTileProfile(firstTilte: "Nom ", subTitle: "Gamo freddy", onPresse: () {}, iconsprofile: Icons.key,),
                            const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Divider(
                                  color: Colors.yellow,
                                  thickness: 1,
                                ),
                              ),
                            ListTileProfile(firstTilte: "Filiere", subTitle: "GENIE logiciel", onPresse: () {}, iconsprofile: Icons.key,),
                            
                          ],
                                            ),
                        ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ListTileProfile extends StatelessWidget {
  final String firstTilte;
  final String subTitle;
  final IconData iconsprofile;
  final Function() onPresse;
  const ListTileProfile(
      {super.key,
      required this.firstTilte,
      required this.subTitle,
      required this.iconsprofile,
      required this.onPresse});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPresse,
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(firstTilte, style: const TextStyle(color: kTexColor, fontSize: kDefaultPadding-10,fontWeight: FontWeight.w700),),
        ),
        subtitle: Text(subTitle, style: const TextStyle(color: kPrimarColor, fontSize: kDefaultPadding-12,fontWeight: FontWeight.w700)),
        leading: Icon(iconsprofile, color: kTexColor,),
      ),
    );
  }
}
