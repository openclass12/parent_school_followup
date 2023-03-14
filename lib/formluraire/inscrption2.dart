import 'package:flutter/material.dart';
import 'package:parent_school_followup/formluraire/resetpassword.dart';
//import 'package:parent_school_followup/theme.dart';
import '../animation/animation_lancement.dart';
import 'package:parent_school_followup/constant.dart';
import 'package:parent_school_followup/formluraire/connexion.dart';
import '../widget/button.dart';

//import 'package:parent_school_followup/size_config.dart';

class Inscrption2Scren extends StatefulWidget {
  static String routeName = '/Inscription';
  

  @override
  State<Inscrption2Scren> createState() => _Inscrption2ScrenState();
}

class _Inscrption2ScrenState extends State<Inscrption2Scren> {
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
                SizedBox(height: 30),
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
                    "Matricule Enfant",
                    style: TextStyle(
                        color: kTextBlockColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Animation_lancement(
                  delay: 1800,
                  child: Text(
                    "Entrez le matricule d'un enfant \n pour acceder a l'application",
                    style: TextStyle(
                        color: kTextBlockColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding *2,
                ),
                Animation_lancement(delay: 3000, child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: SingForm(),
                )),
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

class SingForm extends StatefulWidget {
  const SingForm({
    super.key,
  });

  @override
  State<SingForm> createState() => _SingFormState();
}

class _SingFormState extends State<SingForm> {
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
            const SizedBox(
              height: 50,
            ),
            Animation_lancement(
              delay: 2500,
              child: DefaultButton(
                title: 'Connexion',
                iconData: Icons.arrow_forward_outlined,
                onPress: () {
                  if (fromKey.currentState!.validate()) {
                    print("fgd");
                    Navigator.pushReplacementNamed(
                        context, ConnexionScren.routeName);
                  } else {
                    print("zerze");
                  }
                },
              ),
            ),
          ],
        ));
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
        hintText: "Enter le matricule",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconInput(
          icon: Icons.key,
          onpress: () {},
        ),
        suffixIconColor: kPrimaryColorIcon,
      ),
    );
  }
}



class IconInput extends StatelessWidget {
  final IconData icon;
  final VoidCallback onpress;
  const IconInput({
    super.key,
    required this.icon,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(onPressed: onpress, icon: Icon(icon)),
    );
  }
}

void test() {}
