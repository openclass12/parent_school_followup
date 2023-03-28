import 'package:flutter/material.dart';

import 'package:parent_school_followup/constant.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(top:kDefaultPadding*2),
        child: ListView(
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                cardPresent(
                name: 'Heure',
                data: Icons.timer_sharp,
                onpress: (){},
              ),
              
              cardPresent(
                name: 'Programme',
                data: Icons.calendar_month,
                onpress: (){},
              ),
              ],
            ),
            const SizedBox(height:kDefaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                cardPresent(
                name: 'Notes',
                data: Icons.work_history,
                onpress: (){},
              ),
              
              cardPresent(
                name: 'Etat \n Pension',
                data: Icons.attach_money,
                onpress: (){},
              ),
              ],
            ),
            const SizedBox(height: kDefaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                cardPresent(
                name: 'Evenement',
                data: Icons.event,
                onpress: (){},
              ),
              
              cardPresent(
                name: 'Obtenir le \n rélève de notes',
                data: Icons.document_scanner,
                onpress: (){},
              ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class cardPresent extends StatelessWidget {
  const cardPresent({
    super.key, required this.name, required this.data, required this.onpress,
  });
  final String name;
  final IconData data;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x665ac18e),
                  Color(0x995ac18e),
                  Color(0xcc5ac18e),
                  Color(0xff5ac18e),
                ]),
            borderRadius: BorderRadius.circular(8)),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              data,
              color: kPrimaryText,
              size: 40,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: kPrimaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
