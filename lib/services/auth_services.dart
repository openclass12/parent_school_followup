import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

    return await getUser(userCredential.user!.uid);
  }

  Future<UserModel> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    var data = {
      'id': userCredential.user!.uid,
      'name': name,
      'email': email,
      'created_at': DateTime.now().toString(),
    };

    _updateAccount(userCredential.user!.uid, data);

    return await loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  _updateAccount(String id, Map<String, dynamic> data) {
    return users.doc(id).set(data, SetOptions(merge: true));
  }

  Future<UserModel> getUser(String id) async {
    var doc = (await users.doc(id).get()).data() as Map<String, dynamic>;
    return UserModel.fromJson(doc);
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
