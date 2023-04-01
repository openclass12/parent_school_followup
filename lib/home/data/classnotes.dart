import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:flutter/services.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:async';
// import 'dart:io';
class NotesE {
  final String name;
  final int cc;
  final int sn;
  final int ra;
  final IconData icon;

  NotesE(this.name, this.cc, this.sn, this.ra, this.icon);
}

class NotesEt {
  final String name;
  final double cc;
  final double sn;
  final double ra;
  final String etat;
  final double total;

  NotesEt(
    this.name,
    this.cc,
    this.sn,
    this.ra,
    this.etat,
    this.total,
  );
}

// class PDFApi {
//    static Future<File> _storeFile(String url, List<int> bytes) async {
//     final filename = basename(url);
//     final dir = await getApplicationDocumentsDirectory();

//     final file = File('${dir.path}/$filename');
//     await file.writeAsBytes(bytes, flush: true);
//     return file;
//   }


//   static Future<File> loadFirebase(String url) async {
  
//       final refPDF = FirebaseStorage.instance.ref().child(url);
//       final bytes = await refPDF.getData();

//       return _storeFile(url, [1]);
    
//   }
// }
