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
      body: ListView.builder(
        itemCount: etudiants.length,
        itemBuilder: (context, index) {
          return afficher_carte(etudiant: etudiants[index]);
        },
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

class afficher_carte extends StatelessWidget {
  const afficher_carte({
    super.key,
    required this.etudiant,
  });
  final Etudiant etudiant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Presentation(etudiant: etudiant,)));
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
                    radius: MediaQuery.of(context).size.width * 0.15,
                    backgroundImage: AssetImage(etudiant.imagephoto),
                  )),
              Positioned(
                  top: 2,
                  right: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      children: [
                        ListTileProfile(
                          firstTilte: "matricule",
                          subTitle: etudiant.matricule,
                          onPresse: () {},
                          iconsprofile: Icons.key,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            color: Colors.yellow,
                            thickness: 1,
                          ),
                        ),
                        ListTileProfile(
                          firstTilte: "Nom ",
                          subTitle: etudiant.nom,
                          onPresse: () {},
                          iconsprofile: Icons.key,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            color: Colors.yellow,
                            thickness: 1,
                          ),
                        ),
                        ListTileProfile(
                          firstTilte: "Filiere",
                          subTitle: "GENIE logiciel",
                          onPresse: () {},
                          iconsprofile: Icons.key,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
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
          child: Text(
            firstTilte,
            style: const TextStyle(
                color: kTexColor,
                fontSize: kDefaultPadding - 10,
                fontWeight: FontWeight.w700),
          ),
        ),
        subtitle: Text(subTitle,
            style: const TextStyle(
                color: kPrimarColor,
                fontSize: kDefaultPadding - 12,
                fontWeight: FontWeight.w700)),
        leading: Icon(
          iconsprofile,
          color: kTexColor,
        ),
      ),
    );
  }
}
