import 'package:flutter/material.dart';
import 'package:parent_school_followup/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firestorage {
  final CollectionReference collecion =
      FirebaseFirestore.instance.collection('Etudiant');

  // suivi etudiant

  Future<String> suivieEtudiant(String docID, String Matricule) async {
    final CollectionReference collecion =
        FirebaseFirestore.instance.collection('Etudiant');
    String res = 'Echec le matricule est incorect';
    String ref = collecion.doc(docID).toString();
    if (ref == Matricule) {
      res = 'reuissie';
      return res;
    }
    return res;
  }

  Future<Map<String, dynamic>> suivieEtudiantTest(String matricule) async {
    final CollectionReference collecion =
        FirebaseFirestore.instance.collection('Etudiant');
    var data =
        (await collecion.doc(matricule).get()).data() as Map<String, dynamic>;
    return data;
  }
}
