import 'package:flutter/material.dart';
import 'package:parent_school_followup/formluraire/resetpassword.dart';
//import 'package:parent_school_followup/theme.dart';
import '../animation/animation_lancement.dart';
import 'package:parent_school_followup/constant.dart';

import '../home/home.dart';
import '../widget/button.dart';
//import 'package:parent_school_followup/size_config.dart';

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
            child: Column(
              children: const [
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
                    "Entrez le matricule d'un enfant  \n pour acceder a l'application",
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
  @override
  Widget build(BuildContext context) {
    return Form(
        key: fromKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            inputName(),
            const SizedBox(height: 30),
            FromErrors(errors: errors),
            Animation_lancement(
              delay: 2500,
              child: DefaultButton(
                title: 'connexion',
                iconData: Icons.arrow_forward_outlined,
                onPress: () {
                  if (fromKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context)=>HomeNavigation()));
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
