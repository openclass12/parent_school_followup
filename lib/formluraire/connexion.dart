import 'package:flutter/material.dart';
import 'package:parent_school_followup/formluraire/inscrription.dart';
import 'package:parent_school_followup/formluraire/resetpassword.dart';
import 'package:parent_school_followup/services/auth_services.dart';
//import 'package:parent_school_followup/theme.dart';
import '../animation/animation_lancement.dart';
import 'package:parent_school_followup/constant.dart';

import '../home/home.dart';
import '../services/auth_services.dart';
import '../widget/button.dart';
//import 'package:parent_school_followup/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widget/showSnackbar.dart';
//import 'package:parent_school_followup/services/firebase_auth.dart';

late bool _passwordVissible;
TextEditingController _emailcontroller = TextEditingController();
TextEditingController _passcontroller = TextEditingController();

class ConnexionScren extends StatefulWidget {
  static String routeName = '/Connexion';

  @override
  State<ConnexionScren> createState() => _ConnexionScrenState();
}

class _ConnexionScrenState extends State<ConnexionScren> {
  @override
  void initState() {
    super.initState();
    _passwordVissible = true;
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);

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
                  child: Text(
                    "Connexion",
                    style: TextStyle(
                        color: kTextBlockColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: 50),
                Animation_lancement(
                  delay: 1500,
                  child: FlutterLogo(
                    size: 150,
                  ),
                ),
                SizedBox(height: 50),
                Animation_lancement(delay: 2300, child: SingForm()),
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ResetPassword.routeName);
                  },
                  child: const Text(
                    'mot de passe oublier ',
                    style: TextStyle(
                        color: kPrimaryColorIcon,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passcontroller.dispose();
  }

  void loginUpUser() async {
    FirebaseAuthentification(FirebaseAuth.instance).loginWidthEmailPassword(
        email: _emailcontroller.text, password: _passcontroller.text, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: fromKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            inputEmail(),
            const SizedBox(height: 30),
            inputPassword(),
            const SizedBox(
              height: 20,
            ),
            
            Animation_lancement(
              delay: 2500,
              child: DefaultButton(
                title: 'connexion',
                iconData: Icons.arrow_forward_outlined,
                onPress: loginUpUser,
                //   if (fromKey.currentState!.validate()) {

                //     // Navigator.pushReplacement(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) => HomeNavigation()));
                //   } else {
                //     print("zerze");
                //   }
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
            });
          },
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
}

                          setState(() {
                            isLoading = false;
                          });

                          Navigator.of(context).popAndPushNamed(
                            HomeNavigation.routeName,
                          );
                        } on FirebaseAuthException catch (e) {
                          showSnackbar(context,e.message!);
                          setState(() {
                            isLoading = false;
                          });
                        } catch (e) {
                          
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    }),
              ),
            ],
          ),
        ));
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
