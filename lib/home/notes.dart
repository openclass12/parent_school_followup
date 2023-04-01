import 'package:flutter/material.dart';

import 'package:parent_school_followup/home/data/classnotes.dart';
import 'package:parent_school_followup/constant.dart';

List<NotesE> notes = [
  NotesE('analyse/matématiques', 12, 14, 0, Icons.admin_panel_settings_sharp),
];

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryText,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Table(
                border: TableBorder.all(
                    color: const Color.fromARGB(176, 61, 44, 44)),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  const TableRow(
                      decoration: BoxDecoration(
                        color: kPrimaryGreenButton,
                      ),
                      children: [
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Matieres",
                                style: TextStyle(
                                    color: kPrimaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "notes cc",
                                style: TextStyle(
                                    color: kPrimaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Notes \n SN",
                                style: TextStyle(
                                    color: kPrimaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "notes Ra",
                                style: TextStyle(
                                    color: kPrimaryText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Etat",
                                style: TextStyle(
                                    color: kPrimaryText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ]),
                  TableRow(children: [
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Analyse mathematique"),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "12",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "10",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "0",
                          ),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Fermer")),
                                            ],
                                            title: const Text("Decision"),
                                            contentPadding:
                                                const EdgeInsets.all(8),
                                            content: const SizedBox(
                                              height: 100,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text("note final:"),
                                                        Text("11.5",
                                                            style: TextStyle(
                                                                color:
                                                                    kPrimaryGreenButton)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text("reussir",
                                                        style: TextStyle(
                                                            color:
                                                                kPrimaryGreenButton))
                                                  ]),
                                            ),
                                          ));
                                },
                                child: const Text(" voir")))),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Algrébre lineaire"),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "14",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "8",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "15",
                          ),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Fermer")),
                                            ],
                                            title: const Text("Decision"),
                                            contentPadding:
                                                const EdgeInsets.all(8),
                                            content: const SizedBox(
                                              height: 100,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text("note final:"),
                                                        Text("13.5",
                                                            style: TextStyle(
                                                                color:
                                                                    kPrimaryGreenButton)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text("reussir",
                                                        style: TextStyle(
                                                            color:
                                                                kPrimaryGreenButton))
                                                  ]),
                                            ),
                                          ));
                                },
                                child: const Text(" voir")))),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("inforgraphie"),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "8",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "10",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "13",
                          ),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Fermer")),
                                            ],
                                            title: const Text("Decision"),
                                            contentPadding:
                                                const EdgeInsets.all(8),
                                            content: const SizedBox(
                                              height: 100,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text("note final:"),
                                                        Text("11.75",
                                                            style: TextStyle(
                                                                color:
                                                                    kPrimaryGreenButton)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text("reussir",
                                                        style: TextStyle(
                                                            color:
                                                                kPrimaryGreenButton))
                                                  ]),
                                            ),
                                          ));
                                },
                                child: const Text(" voir")))),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("programmation structuré"),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "12",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "0",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "8",
                          ),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("Fermer")),
                                          ],
                                          title: const Text("Decision"),
                                          contentPadding:
                                              const EdgeInsets.all(8),
                                          content: const SizedBox(
                                            height: 100,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("note final:"),
                                                      Text("10.5",
                                                          style: TextStyle(
                                                              color:
                                                                  kPrimaryGreenButton)),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text("reussir",
                                                      style: TextStyle(
                                                          color:
                                                              kPrimaryGreenButton))
                                                ]),
                                          ),
                                        ));
                              },
                              child: const Text(" voir")),
                        ))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("algoritme de base"),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "16",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "14",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "0",
                          ),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Fermer")),
                                            ],
                                            title: const Text("Decision"),
                                            contentPadding:
                                                const EdgeInsets.all(8),
                                            content: const SizedBox(
                                              height: 100,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text("note final:"),
                                                        Text("15.75",
                                                            style: TextStyle(
                                                                color:
                                                                    kPrimaryGreenButton)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text("reussir",
                                                        style: TextStyle(
                                                            color:
                                                                kPrimaryGreenButton))
                                                  ]),
                                            ),
                                          ));
                                },
                                child: const Text(" voir")))),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Anglais "),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "8",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "7",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "6",
                          ),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("Fermer")),
                                          ],
                                          title: const Text("Decision"),
                                          contentPadding:
                                              const EdgeInsets.all(8),
                                          content: const SizedBox(
                                            height: 100,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("note final:"),
                                                      Text("8",
                                                          style: TextStyle(
                                                              color:
                                                                  kPrimaryRedButton)),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text("echouer",
                                                      style: TextStyle(
                                                          color:
                                                              kPrimaryRedButton))
                                                ]),
                                          ),
                                        ));
                              },
                              child: const Text(" voir")),
                        )),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Achiterture \n ordinateurs"),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "17",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "0",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "14",
                          ),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("Fermer")),
                                          ],
                                          title: const Text("Decision"),
                                          contentPadding:
                                              const EdgeInsets.all(8),
                                          content: const SizedBox(
                                            height: 100,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("note final:"),
                                                      Text("15",
                                                          style: TextStyle(
                                                              color:
                                                                  kPrimaryGreenButton)),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text("reussir",
                                                      style: TextStyle(
                                                          color:
                                                              kPrimaryGreenButton))
                                                ]),
                                          ),
                                        ));
                              },
                              child: const Text(" voir")),
                        )),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("outils bureautique"),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "17",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "16",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "0",
                          ),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("Fermer")),
                                          ],
                                          title: const Text("Decision"),
                                          contentPadding:
                                              const EdgeInsets.all(8),
                                          content: const SizedBox(
                                            height: 100,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("note final:"),
                                                      Text("16.5",
                                                          style: TextStyle(
                                                              color:
                                                                  kPrimaryGreenButton)),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text("reussir",
                                                      style: TextStyle(
                                                          color:
                                                              kPrimaryGreenButton))
                                                ]),
                                          ),
                                        ));
                              },
                              child: const Text(" voir")),
                        )),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Expression orale"),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "16",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "4",
                          ),
                        )),
                    const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "16",
                          ),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("Fermer")),
                                          ],
                                          title: const Text("Decision"),
                                          contentPadding:
                                              const EdgeInsets.all(8),
                                          content: const SizedBox(
                                            height: 100,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("note final:"),
                                                      Text("16",
                                                          style: TextStyle(
                                                              color:
                                                                  kPrimaryGreenButton)),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text("reussir",
                                                      style: TextStyle(
                                                          color:
                                                              kPrimaryGreenButton))
                                                ]),
                                          ),
                                        ));
                              },
                              child: const Text(" voir")),
                        )),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: InkWell(
                onTap:(){
                   showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Fermer")),
                                            ],
                                            title: const Text("Moyenne Trimestrielle"),
                                            contentPadding:
                                                const EdgeInsets.all(8),
                                            content: const SizedBox(
                                              height: 110,
                                              child:  Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("moyenne obtenue:"),
                                                    Text("13.12",
                                                        style: TextStyle(
                                                            color:
                                                                kPrimaryGreenButton)),
                                                  ],
                                                  
                                                ),
                                                SizedBox(height: 20,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Nombre de credit \n valider:"),
                                                    Text("28/30",
                                                        style: TextStyle(
                                                            color:
                                                                kPrimaryGreenButton)),
                                                  ],
                                                  
                                                ),
                                                SizedBox(height: 20,),
                                                
                                              ]),
                                            ),
                                          ));
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
                      "Moyenne",
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
    );
  }
}
