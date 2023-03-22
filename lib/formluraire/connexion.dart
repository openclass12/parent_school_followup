import 'package:flutter/material.dart';
import 'package:parent_school_followup/formluraire/inscrription.dart';
import 'package:parent_school_followup/formluraire/resetpassword.dart';
import 'package:parent_school_followup/services/auth_services.dart';
//import 'package:parent_school_followup/theme.dart';
import '../animation/animation_lancement.dart';
import 'package:parent_school_followup/constant.dart';

import '../home/home.dart';
import '../widget/button.dart';
//import 'package:parent_school_followup/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parent_school_followup/services/firebase_auth.dart';

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
    // TODO: implement initState
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
                  child: FlutterLogo(
                    size: 150,
                  ),
                ),
                SizedBox(height: 50),
                Animation_lancement(
                  delay: 1500,
                  child: Text(
                    "Welcome back",
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
                    "Connectez vous avec email et votre password \n pour acceder a l'application",
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
                    Navigator.pushNamed(
                      context,
                      InscirptionScreen.routeName,
                    );
                  },
                  child: const Text(
                    'Pas de compte? Inscription',
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

  late AuthServices _authServices;

  bool _isLoading = false;

  @override
  void initState() {
    _authServices = AuthServices();
    super.initState();
  }

  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passcontroller.dispose();
  }

  // void loginUpUser() async {
  //   FirebaseAuthentification(FirebaseAuth.instance).loginWidthEmailPassword(
  //     email: _emailcontroller.text,
  //     password: _passcontroller.text,
  //     context: context,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
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
          ),
          const SizedBox(height: 30),
          TextFormField(
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
          ),
          const SizedBox(
            height: 20,
          ),
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            ),
          FromErrors(errors: errors),
          Animation_lancement(
            delay: 2500,
            child: DefaultButton(
              title: 'connexion',
              iconData: Icons.arrow_forward_outlined,
              onPress: () async {
                if (formKey.currentState?.validate() ?? false) {
                  try {
                    setState(() {
                      _isLoading = true;
                    });
                    var user = await _authServices.loginWithEmailAndPassword(
                      email: _emailcontroller.text,
                      password: _passcontroller.text,
                    );

                    setState(() {
                      _isLoading = false;
                    });

                    Navigator.of(context).popAndPushNamed(
                      HomeNavigation.routeName,
                    );
                  } on FirebaseAuthException catch (e) {
                    print(e);
                    setState(() {
                      _isLoading = false;
                    });
                  } catch (e) {
                    print(e);
                    setState(() {
                      _isLoading = false;
                    });
                  }
                }
              },
            ),
          ),
        ],
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
