import 'package:flutter/material.dart';
import 'package:parent_school_followup/formluraire/resetpassword.dart';
import 'package:parent_school_followup/services/firebase_auth.dart';
//import 'package:parent_school_followup/theme.dart';
import '../animation/animation_lancement.dart';
import 'package:parent_school_followup/constant.dart';
import 'package:parent_school_followup/formluraire/connexion.dart';
import '../home/home.dart';
import '../widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import '../formluraire/inscrption2.dart';

//import 'package:parent_school_followup/size_config.dart';
late bool _passwordVissible;
late bool _comfirmVissible;
final TextEditingController _namecontroller = TextEditingController();
final TextEditingController _emailcontroller = TextEditingController();
final TextEditingController _passcontroller = TextEditingController();

class InscirptionScreen extends StatefulWidget {
  static String routeName = '/Inscription';

  @override
  State<InscirptionScreen> createState() => _InscirptionScreenState();
}

class _InscirptionScreenState extends State<InscirptionScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVissible = true;
    _comfirmVissible = true;
  }

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
                    size: 50,
                  ),
                ),
                SizedBox(height: 20),
                Animation_lancement(
                  delay: 1500,
                  child: Text(
                    "Inscription",
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
                    "Remplissez les champs suivants   \n pour acceder a l'application",
                    style: TextStyle(
                        color: kTextBlockColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding - 8,
                ),
                Animation_lancement(delay: 3000, child: SingForm()),
              ],
            ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Animation_lancement(
            delay: 2600,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "j'ai un compte ".toLowerCase(),
                        style: const TextStyle(
                            color: kTextBlockColor,
                            fontWeight: FontWeight.w700,
                            fontSize: kDefaultPadding - 10),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ConnexionScren.routeName);
                        },
                        child: Text(
                          ' connexion'.toUpperCase(),
                          style: const TextStyle(
                              color: kPrimaryColorIcon,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
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
  late String name;
  late String email;
  late String password;

  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  final List<String> errors = [];

  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passcontroller.dispose();
    _namecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: fromKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            inputName(),
            const SizedBox(
              height: 20,
            ),
            // inputPrenom(),
            // const SizedBox(
            //   height: 20,
            // ),
            // inputPhone(),
            // const SizedBox(
            //   height: 20,
            // ),
            inputEmail(),
            const SizedBox(height: 20),
            inputPassword(),
            const SizedBox(
              height: 20,
            ),
            inputconfirmPassword(),
            FromErrors(errors: errors),
            const SizedBox(
              height: 20,
            ),
            Animation_lancement(
              delay: 2500,
              child: DefaultButton(
                title: 'connexion',
                iconData: Icons.arrow_forward_outlined,
                onPress: (){},
              ),
            ),
          ],
        ));
  }

  TextFormField inputPassword() {
    return TextFormField(
      obscureText: _passwordVissible,
      validator: (value) {
        if (value!.isEmpty) {
          return kChamVide;
        } else if (value.length < 8) {
          return kEmailInvalidError;
        }
        return null;
      },
      controller: _passcontroller,
      decoration: InputDecoration(
        labelText: "password",
        hintText: "Enter votre mot de passe",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconInput(
          icon: _passwordVissible ? Icons.lock : Icons.lock_open,
          onpress: () {
            setState(() {
              _passwordVissible = !_passwordVissible;
              _comfirmVissible = !_comfirmVissible;
            });
          },
        ),
        suffixIconColor: kPrimaryColorIcon,
      ),
    );
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
      controller: _namecontroller,
      decoration: InputDecoration(
        labelText: "Nom",
        hintText: "Enter votre nom",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconInput(
          icon: Icons.person,
          onpress: () {},
        ),
        suffixIconColor: kPrimaryColorIcon,
      ),
    );
  }
}

TextFormField inputPrenom() {
  return TextFormField(
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value!.isEmpty) {
        return kChamVide;
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: "Prenom",
      hintText: "Enter votre prenom",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: IconInput(
        icon: Icons.person,
        onpress: () {},
      ),
      suffixIconColor: kPrimaryColorIcon,
    ),
  );
}

TextFormField inputPhone() {
  return TextFormField(
    keyboardType: TextInputType.phone,
    validator: (value) {
      if (value!.isEmpty) {
        return kChamVide;
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: "telephone",
      hintText: "Enter votre numero de telephone",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: IconInput(
        icon: Icons.call,
        onpress: () {},
      ),
      suffixIconColor: kPrimaryColorIcon,
    ),
  );
}

TextFormField inputEmail() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      if (value!.isEmpty) {
        return kEmailNullError;
      } else if (value.isValidEmail() == false) {
        return kEmailInvalidError;
      } else if (value.isValidEmail() == false) {
        return null;
      }
      return null;
    },
    controller: _emailcontroller,
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

TextFormField inputconfirmPassword() {
  return TextFormField(
    obscureText: _comfirmVissible,
    validator: (value) {
      if (value!.isEmpty) {
        return kChamVide;
      } else if (value.length < 8) {
        return kEmailInvalidError;
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: "password",
      hintText: "Enter votre mot de passe",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: IconInput(
        icon: _passwordVissible ? Icons.lock : Icons.lock_open,
        onpress: () {},
      ),
      suffixIconColor: kPrimaryColorIcon,
    ),
  );
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

void test() {}
