import 'package:flutter/material.dart';

//import '../routes/routes.dart';
//import '../demarage_application/splash_screen.dart';
import 'package:parent_school_followup/constant.dart';

import '../formluraire/validation.dart';
import 'page acceuil/class.dart';
import 'page acceuil/presentation.dart';

class AceuilScrenn extends StatefulWidget {
  AceuilScrenn({super.key});

  @override
  State<AceuilScrenn> createState() => _AceuilScrennState();
}

class _AceuilScrennState extends State<AceuilScrenn> {
  final List<Etudiant> etudiants = [
    Etudiant("IucQ20214", "Gamo freddy", "image/photo_etudiant/photo1.JPG",
        "genie logicile", ["math", "francais"], [10, 12]),
    Etudiant("IucQ20214", "Gamo silatcho", "image/photo_etudiant/photo2.JPG",
        "genie logicile", ["math", "francais"], [10, 12]),
    Etudiant("IucQ20214", "Gamo silatcho", "image/photo_etudiant/photo2.JPG",
        "genie logicile", ["math", "francais"], [10, 12])
  ];

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
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10, top: kDefaultPadding),
            child: CardPresentation(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColorIcon,
        onPressed: () {
          //Navigator.push(
          // context, MaterialPageRoute(builder: (context) => ValidationReset()));
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => ValidationReset())));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CardPresentation extends StatelessWidget {
  const CardPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      child: Container(
        height: 270,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: kPrimaryText,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  child: Image.asset("image/photo_etudiant/photo1.JPG"),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 12),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: kPrimaryColorFond,
                                  child: Text(
                                    "N",
                                    style: TextStyle(
                                        color: kPrimaryText,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Text("Nom : ",
                                    style: TextStyle(
                                      color: Colors.black26.withOpacity(0.5),
                                      fontSize: 19,
                                    )),
                                const Text(
                                  "Gamo Silatchom \nFreddy",
                                  style: TextStyle(
                                      color: kPrimaryColorFond, fontSize: 16,fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                backgroundColor: kPrimaryGreenButton,
                                child: Text(
                                  "F",
                                  style: TextStyle(
                                      color: kPrimaryText,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text("Filiere : ",
                                  style: TextStyle(
                                    color: Colors.black26.withOpacity(0.5),
                                    fontSize: 19,
                                  )),
                              const Text(
                                "genie logiciel",
                                style: TextStyle(
                                    color: kPrimaryGreenButton, fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 80, top: 12),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: kPrimaryRedButton,
                                  child: Text(
                                    "N",
                                    style: TextStyle(
                                        color: kPrimaryText,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Text("Niveau : ",
                                    style: TextStyle(
                                      color: Colors.black26.withOpacity(0.5),
                                      fontSize: 19,
                                    )),
                                const Text(
                                  "II",
                                  style: TextStyle(
                                      color: kPrimaryRedButton, fontSize: 16),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: kDefaultPadding),
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Container(
                      width: size.width * 0.4,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: kPrimaryGreenButton,
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(5, 2))),
                      child: const Center(child: Text("voir infos ",style: TextStyle(color: kPrimaryText, fontSize: 17),)),
                    )),
                    TextButton(
                    onPressed: () {},
                    child: Container(
                      width: size.width * 0.4,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: kPrimaryRedButton,
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(5, 2))),
                      child: const Center(child: Text("supprimer ", style: TextStyle(color: kPrimaryText, fontSize: 17),),),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
