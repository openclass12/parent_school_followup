import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widget/showSnackbar.dart';

class FirebaseAuthentification {
  final FirebaseAuth _auth;
  FirebaseAuthentification(this._auth);

  //Email inscrption
  Future<void> signUpWithEmail({
    required String email,
    required String name,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await sendEmailVerifacation(context);
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
    }
  }
//login

  Future<void> loginWidthEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified){
        await sendEmailVerifacation(context);
        
      }
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
    }
  }

  // Email verification
  Future<void> sendEmailVerifacation(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackbar(context, "email de verification envoyer");
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
    }
  }
}
