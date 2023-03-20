

import 'package:flutter/material.dart';
import 'package:parent_school_followup/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class FirebaseService {
//    final CollectionReference collecion= FirebaseFirestore.instance.collection('Etudiant');

//    Future<String> getValue(String docID) async{
//     final ref= collecion.doc(docID);
//     final snapshot= await ref.get();
//     final value = snapshot.data()['nom_filiere'];
//     return value.toString();

//    }
// }
class TESE extends StatefulWidget {
  const TESE({super.key});

  @override
  State<TESE> createState() => _TESEState();
}

class _TESEState extends State<TESE> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kTexColor,
      body: Center(child: Test()),
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final Stream<QuerySnapshot> _etudiant =
      FirebaseFirestore.instance.collection('filiere').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Etudiant').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("smoething is wrong");
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                DocumentReference<Map<String, dynamic>> filiere =
                    document.data() as DocumentReference<Map<String, dynamic>>;
                return ListTile(
                  subtitle: Text(data['niveau'].toString()),
                );
              }).toList(),
            );
        }
      },
    );
  }
}

