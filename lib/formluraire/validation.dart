import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:parent_school_followup/constant.dart';
import 'package:parent_school_followup/formluraire/inscrption.dart';

import '../home/babilliard.dart';




//import 'package:parent_school_followup/size_config.dart';

final TextEditingController _namecontroller = TextEditingController();
bool isPage = false;

class AcceuilScreen extends StatefulWidget {
  static String routeName = '/Validation';

  @override
  State<AcceuilScreen> createState() => _AcceuilScreenState();
}

class _AcceuilScreenState extends State<AcceuilScreen> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _namecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryText,
      appBar: AppBar(
        toolbarHeight: 215,
        leadingWidth: double.infinity,
        leading: Column(children: [
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: const BoxDecoration(
                color: kPrimaryGreenButton,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.people_alt,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Suivez ,Votre Enfant",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1,
                    wordSpacing: 2,
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Form(
                  key: fromKey,
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      controller: _namecontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "recherhce....",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                        prefixIcon: const Icon(Icons.search,
                            size: 25, color: kPrimaryGreenButton),
                      ),
                      onFieldSubmitted: (value) {
                        setState(() {
                          isPage = true;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
     
      body: isPage
          ? Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('Etudiant')
                      .where('matricule',
                          isGreaterThanOrEqualTo: _namecontroller.text)
                      .get(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasError) {
                      const Center(
                        child: Text("c'est etudiant n'exsite pas"),
                      );
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        return GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.0,
                                  mainAxisSpacing: 12.0,
                                  mainAxisExtent: 250),
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;

                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: kTexColor,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      offset: Offset(0, 5),
                                    ),
                                    BoxShadow(
                                      color: kTexColor,
                                      offset: Offset(0, 5),
                                    ),
                                    BoxShadow(
                                      color: kTexColor,
                                      offset: Offset(0, 5),
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "image/photo_etudiant/photo1.JPG"),
                                    radius: 30,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                      child: Text(
                                    data['Nom'],
                                    style: const TextStyle(
                                        color: kPrimaryGreenButton,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1.5),
                                  )),
                                  Center(
                                      child: Text(
                                    data['Nom'],
                                    style: const TextStyle(
                                        color: kPrimaryGreenButton,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )),
                                  Row(
                                    children: [
                                      const Text("filiere :"),
                                      Text(data['filiere'],
                                          style: const TextStyle(
                                              color: kPrimaryGreenButton,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 1.5))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text("niveau :"),
                                      Text(data['niveau'].toString(),
                                          style: const TextStyle(
                                              color: kPrimaryGreenButton,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 1.5))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                 const  Babilliard()));
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          color: kPrimaryGreenButton),
                                      child: const Center(
                                        child: Text("Suivie",
                                            style: TextStyle(
                                                color: kPrimaryText,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w900)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        );
                    }
                  })),
            )
          : const Center(
              child: Text(""),
            ),
    );
  }
}



