import 'package:flutter/material.dart';

import 'package:parent_school_followup/home/notes.dart';

import 'package:parent_school_followup/constant.dart';


class NotesFinal extends StatefulWidget {
  const NotesFinal({super.key});

  @override
  State<NotesFinal> createState() => _NotesFinalState();
}

class _NotesFinalState extends State<NotesFinal> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       appBar: AppBar(
        elevation: 3,
        actions: [
          
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kPrimaryGreenButton,
            )),
        title: const Text(
          "Notes",
          style: TextStyle(
              color: kPrimaryGreenButton,
              fontSize: 18,
              fontWeight: FontWeight.w900),
        ),
        bottom: const TabBar(
              isScrollable: true,
              indicatorColor: kPrimaryGreenButton,
              indicatorWeight: 5,
              tabs: [
                RepeatedTab(
                  label: "Semestre1",
                ),
             
                RepeatedTab(label: 'Semetre 2'),
                
                
              ]),
      ),
      body: const  TabBarView(children: [
          Notes(),
          Notes(),
      ]
      )
      )
    );
  }
}









class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}



