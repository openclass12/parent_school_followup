import 'package:parent_school_followup/constant.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:parent_school_followup/home/data/recu.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:parent_school_followup/home/data/classnotes.dart';

class Paiement extends StatefulWidget {
  const Paiement({super.key});

  @override
  State<Paiement> createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryText,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: false,
          title: const Text(
            "Versement effectuer",
            style: TextStyle(
                color: kPrimaryGreenButton,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 280,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "numero versement",
                              style: stylePaiement(),
                            ),
                            Text(
                              "01",
                              style: styleArgent(),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            color: kPrimaryGreenButton,
                            thickness: 1,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Somme verser",
                              style: stylePaiement(),
                            ),
                            Text(
                              "50000",
                              style: styleArgent(),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date de versement",
                              style: stylePaiement(),
                            ),
                            Text(
                              "12-march-2023",
                              style: styleArgent(),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tranche solder",
                              style: stylePaiement(),
                            ),
                            Text(
                              "inscrption",
                              style: styleArgent(),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "reste  a payer",
                              style: stylePaiement(),
                            ),
                            Text(
                              "400000",
                              style: styleArgent(),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              // final url = 'Bulletin.pdf';
                              // final file = await PDFApi.loadFirebase(url);

                              // if (file == false) return;
                              // openPDF(context, file);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kPrimaryGreenButton,
                              ),
                              child: const Center(
                                child: Text(
                                  "recu",
                                  style: TextStyle(
                                      color: kPrimaryText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]));
  }

  TextStyle stylePaiement() =>
      const TextStyle(color: Color.fromARGB(153, 49, 46, 46), fontSize: 17);
  TextStyle styleArgent() =>
      const TextStyle(color: kPrimaryGreenButton, fontSize: 17);
      // void openPDF(BuildContext context, File file) => Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      // );
}
