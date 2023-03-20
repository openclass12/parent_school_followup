import 'package:flutter/material.dart';
import 'package:parent_school_followup/constant.dart';
import 'package:parent_school_followup/home/page acceuil/test_fire.dart';

import 'class.dart';

class Presentation extends StatelessWidget {
  Presentation({super.key, required this.etudiant});
  final Etudiant etudiant;
  final anne = ["2022-2023"];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTexColor,
      appBar: AppBar(
        elevation: 8,
        toolbarHeight: 90,
        leading: const Icon(
          Icons.arrow_back,
          color: kPrimaryColorIcon,
        ),
        backgroundColor: kTexColor,
        title: const Text(
          "presentation",
          style: TextStyle(color: kPrimarColor, fontSize: 16),
        ),
        centerTitle: false,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CircleAvatar(
                  backgroundImage: AssetImage(etudiant.imagephoto),
                ),
              ),
              const Text(
                "anne-scolaire:\n 2022/2023",
                style: TextStyle(color: kPrimaryColorIcon, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding + 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCard(
                    text: "Notes",
                    icon: Icons.nat,
                    onpress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TESE()));
                    }),
                HomeCard(
                    text: "Programme",
                    icon: Icons.calendar_month,
                    onpress: () {})
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCard(
                    text: "sdfsdf", icon: Icons.abc_outlined, onpress: () {}),
                HomeCard(
                    text: "sdfsdf", icon: Icons.abc_outlined, onpress: () {})
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCard(
                    text: "sdfsdf", icon: Icons.abc_outlined, onpress: () {}),
                HomeCard(
                    text: "sdfsdf", icon: Icons.abc_outlined, onpress: () {})
              ],
            ),
          )
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
    super.key,
    required this.text,
    required this.icon,
    required this.onpress,
  });
  final String text;
  final IconData icon;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Card(
        elevation: 8,
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 6,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: kTexColor,
            borderRadius: BorderRadius.circular(kDefaultPadding / 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                size: 36,
                color: kPrimaryColorIcon,
              ),
              Text(
                text,
                style: const TextStyle(
                    color: kPrimaryColorIcon,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
