import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:parent_school_followup/formluraire/resetpassword.dart';
//import 'package:parent_school_followup/services/firebase_auth.dart';
//import 'package:parent_school_followup/theme.dart';
import '../animation/animation_lancement.dart';
import 'package:parent_school_followup/constant.dart';
import 'package:parent_school_followup/services/fire_firestore.dart';
import 'package:parent_school_followup/home/acceuil.dart';
import '../widget/button.dart';
import '../widget/showSnackbar.dart';

//import 'package:parent_school_followup/size_config.dart';

final TextEditingController _matriculecontrolleur = TextEditingController();

class ValidationReset extends StatefulWidget {
  static String routeName = '/Validation';

  @override
  State<ValidationReset> createState() => _ValidationResetState();
}

class _ValidationResetState extends State<ValidationReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTexColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Column(
              children: [
                SizedBox(height: 50),
                Animation_lancement(
                  delay: 1200,
                  child: FlutterLogo(
                    size: 150,
                  ),
                ),
                SizedBox(height: 50),
                Animation_lancement(
                  delay: 1500,
                  child: Text(
                    "Entrez un Matricule",
                    style: TextStyle(
                        color: kTextBlockColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Animation_lancement(
                  delay: 1800,
                  child: Text(
                    "Entrez un  matricule d'un enfant  \n pour le suivre",
                    style: TextStyle(
                        color: kTextBlockColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding * 2,
                ),
                Animation_lancement(delay: 2300, child: SingForm_mat()),
              ],
            ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
        ])),
      ),
    );
  }
}

class SingForm_mat extends StatefulWidget {
  const SingForm_mat({
    super.key,
  });

  @override
  State<SingForm_mat> createState() => _SingForm_matState();
}

class _SingForm_matState extends State<SingForm_mat> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late Firestorage _firestorage = Firestorage();
  @override
  void dispose() {
    super.dispose();
    _matriculecontrolleur.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: fromKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding),
              child: TextFormField(
                keyboardType: TextInputType.name,
                controller: _matriculecontrolleur,
                validator: (value) {
                  if (value!.isEmpty) {
                    return kChamVide;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Matricule",
                  hintText: "Entrez un matricule",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: IconInput(
                    icon: Icons.key,
                    onpress: () {},
                  ),
                  suffixIconColor: kPrimaryColorIcon,
                ),
              ),
            ),
            const SizedBox(height: 30),
            FromErrors(errors: errors),
            Animation_lancement(
              delay: 2500,
              child: DefaultButton(
                title: 'connexion',
                iconData: Icons.arrow_forward_outlined,
                onPress: () async {
                  if (fromKey.currentState!.validate()) {
                    try {
                      var data = await _firestorage
                          .suivieEtudiantTest(_matriculecontrolleur.text);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => AceuilScrenn(data: data,))));
                      
                    } on FirebaseException catch (e) {
                      showSnackbar(context, e.message!);
                    }
                  } else {
                    print("zerze");
                  }
                },
              ),
            ),
          ],
        ));
  }
}

TextFormField inputName() {
  return TextFormField(
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return kChamVide;
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: "Matricule",
      hintText: "Entrez un matricule",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: IconInput(
        icon: Icons.key,
        onpress: () {},
      ),
      suffixIconColor: kPrimaryColorIcon,
    ),
  );
}
