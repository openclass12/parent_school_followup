import 'package:flutter/material.dart';
import 'package:parent_school_followup/constant.dart';

import 'class.dart';

class Presentation extends StatelessWidget {
  Presentation({super.key, required this.etudiant});
  final Etudiant etudiant;
  final anne = ["2022-2023"];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryColorIcon,
          ),
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(children: [
                          const Text("Nom etudiant:",
                              style: TextStyle(
                                  color: kTextBlockColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700)),
                          Text(
                            etudiant.nom,
                            style: const TextStyle(
                                color: kTexColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ]),
                        CircleAvatar(
                          backgroundImage: AssetImage(etudiant.imagephoto),
                          radius: 50,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: [
                          const Text("anne scolaire",
                              style: TextStyle(
                                  color: kTexColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700)),
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23)),
                            child: const Text("2022-2023",
                                style: TextStyle(
                                    color: kTexColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: kTexColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 3),
                    topRight: Radius.circular(kDefaultPadding * 3))),
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: kDefaultPadding),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HomeCard(text: "Note",icon: Icons.timer,onpress: (){},),
                      HomeCard(text: "programme",icon: Icons.timer,onpress: (){},)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HomeCard(text: "Heures",icon: Icons.timer,onpress: (){},),
                      HomeCard(text: "evenements",icon: Icons.timer,onpress: (){},)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeCard(text: "Revele",icon: Icons.timer,onpress: (){},),
                    HomeCard(text: "pension",icon: Icons.timer,onpress: (){},)
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItems(String anne) => DropdownMenuItem(
          child: Text(
        anne,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ));
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key, required this.text, required this.icon, required this.onpress,
  });
  final String text;
  final IconData icon;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
          color: kPrimaryColorIcon,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          children:  [
            Icon(
              icon,
              size: 36,
              color: kTexColor,
            ),
           const  SizedBox(
              height: 15,
            ),
            Text(
              text,
              style:const TextStyle(
                  color: kTexColor, fontSize: 20, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
