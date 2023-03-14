import 'package:flutter/material.dart';
import 'package:parent_school_followup/formluraire/connexion.dart';

import '../animation/animation_lancement.dart';
import 'package:parent_school_followup/constant.dart';

import '../widget/button.dart';

class ResetPassword extends StatefulWidget {
  static String routeName = '/Resetpasswod';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTexColor,
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                    "Entrez votre Email",
                    style: TextStyle(
                        color: kTextBlockColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding * 2,
                ),
                Animation_lancement(
                    delay: 2300,
                    child: Padding(
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
            inputEmail(),
            const SizedBox(height: 30),
            const SizedBox(
              height: 20,
            ),
            FromErrors(errors: errors),
            Animation_lancement(
              delay: 2500,
              child: DefaultButton(
                title: 'reset',
                iconData: Icons.arrow_forward_outlined,
                onPress: () {
                  if (fromKey.currentState!.validate()) {
                    print("fgd");
                    Navigator.pushNamed(context, ConnexionScren.routeName);
                  } else {
                    print("zerze");
                  }
                },
              ),
            ),
          ],
        ));
  }

  TextFormField inputEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return kEmailNullError;
        } else if (value.isValidEmail() == false) {
          return kEmailInvalidError;
        } else if (value.isValidEmail() == true) {
          return null;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter votre mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconInput(
          icon: Icons.mail,
          onpress: () {},
        ),
        suffixIconColor: kPrimaryColorIcon,
      ),
    );
  }
}

class FromErrors extends StatelessWidget {
  const FromErrors({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => fromErros(error: errors[index])),
    );
  }

  Row fromErros({String error = ''}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.error_outline_outlined, color: kErrorBorderColor),
        Text(
          error,
          style: const TextStyle(color: kErrorBorderColor, fontSize: 14),
        )
      ],
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

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^[a-zA-Z-0-9]+[\_\-\.]*[a-zA-Z-0-9]+[@][a-zA-Z-0-9]{2,}[\.]([a-zA-Z-0-9]{2,3})')
        .hasMatch(this);
  }
}
