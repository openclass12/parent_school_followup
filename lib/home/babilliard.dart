import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_school_followup/home/notes.dart';

import 'package:parent_school_followup/constant.dart';
import 'package:parent_school_followup/home/notesfinal.dart';
import 'package:parent_school_followup/home/paiement.dart';

class Babilliard extends StatelessWidget {
  const Babilliard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryText,
        appBar: AppBar(
          elevation: 8,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: kPrimaryGreenButton,
              )),
          title: const Text(
            "Barbilliard",
            style: TextStyle(
                color: kPrimaryGreenButton,
                fontSize: 26,
                fontWeight: FontWeight.w900),
          ),
        ),
        body: Center(
          child: GridView.count(
            
            padding: EdgeInsets.only(top: kDefaultPadding*2),
            crossAxisCount: 2, children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardBarbilliard(
                  svg: "image/iconsvg/icons07.svg",
                  nom: "Heure d'absence",
                  onpress: () {
                     Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                 const  NotesFinal()));
                  },
                ),
              ],
            ),
            CardBarbilliard(
              svg: "image/iconsvg/icons06.svg",
              nom: "Programme",
              onpress: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardBarbilliard(
                  svg: "image/iconsvg/icons03.svg",
                  nom: "Notes",
                  onpress: () {},
                ),
              ],
            ),
            CardBarbilliard(
              svg: "image/iconsvg/icons08.svg",
              nom: "Historique \n de paiement",
              onpress: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardBarbilliard(
                  svg: "image/iconsvg/icons02.svg",
                  nom: "Evenements",
                  
                   onpress: () {
                     Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                 const  Paiement()));
                  },
                ),
              ],
            ),
            CardBarbilliard(
              svg: "image/iconsvg/icons04.svg",
              nom: "Demande du releve",
              onpress: () {},
            ),
          ]),
        ));
  }
}

class CardBarbilliard extends StatelessWidget {
  const CardBarbilliard({
    super.key,
    required this.svg,
    required this.nom,
    required this.onpress,
  });
  final String svg;
  final String nom;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
          height: 290,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svg,
                width: 120,
                height: 100,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                nom,
                style:
                    const TextStyle(color: kPrimaryGreenButton, fontSize: 16),
              ),
              GestureDetector(
                onTap: onpress,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: kPrimaryGreenButton,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      'voir Infos',
                      style: TextStyle(color: kPrimaryText, fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
//