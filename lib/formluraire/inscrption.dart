import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parent_school_followup/constant.dart';
import 'package:parent_school_followup/formluraire/loginscreen.dart';
import 'package:parent_school_followup/formluraire/validation.dart';

import '../services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widget/showSnackbar.dart';

late bool _passwordVissible;
final TextEditingController _emailcontroller = TextEditingController();
final TextEditingController _passcontroller = TextEditingController();
final TextEditingController _namecontroller = TextEditingController();

class Signpscreen extends StatefulWidget {
  const Signpscreen({super.key});

  @override
  State<Signpscreen> createState() => _SignpscreenState();
}

class _SignpscreenState extends State<Signpscreen> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  late AuthServices _authServices;

  bool _isLoading = false;

  @override
  void initState() {
    _authServices = AuthServices();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passcontroller.dispose();
    _namecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            child: Stack(children: <Widget>[
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0x665ac18e),
                    Color(0x995ac18e),
                    Color(0xcc5ac18e),
                    Color(0xff5ac18e),
                  ])),
              child:
                  //SizedBox(height: MediaQuery.of(context).size.width*0.5,),

                  Form(
                      key: fromKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.width * 0.4,
                              ),
                              Text(
                                "Inscption".toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              builName(),
                              const SizedBox(
                                height: 20,
                              ),
                              builEmail(),
                              const SizedBox(
                                height: 20,
                              ),
                              builpassword(),
                              builForgetPassword(),
                              const SizedBox(
                                height: 50,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (fromKey.currentState?.validate() ??
                                      false) {
                                    try {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      var user = await _authServices
                                          .registerWithEmailAndPassword(
                                        email: _emailcontroller.text,
                                        password: _passcontroller.text,
                                        name: _namecontroller.text,
                                      );

                                      setState(() {
                                        _isLoading = false;
                                      });

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  AcceuilScreen())));
                                    } on FirebaseAuthException catch (e) {
                                      showSnackbar(context, e.message!);
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    } catch (e) {
                                      //showSnackbar(context,e);
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: kPrimaryText,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Inscription",
                                      style: TextStyle(
                                          color: kPrimaryGreenButton,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) =>   Loginscreen())));
                                },
                                child: RichText(
                                    text: const TextSpan(children: [
                                  TextSpan(
                                      text: "j'ai un compte ",
                                      style: TextStyle(
                                          color: kPrimaryText,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                  TextSpan(
                                      text: 'Connexion ',
                                      style: TextStyle(
                                          color: kPrimaryText,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                ])),
                              )
                            ],
                          ),
                        ),
                      ))),
        ])),
      ),
    );
  }
}

Widget builEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Email",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: kPrimaryText,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 65,
        child: TextFormField(
          controller: _emailcontroller,
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
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Enter votre email",
              hintStyle: TextStyle(color: Colors.black38),
              prefixIcon: Icon(
                Icons.email,
                color: kPrimaryGreenButton,
              )),
        ),
      )
    ],
  );
}

Widget builpassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Mot de passe",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: kPrimaryText,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 65,
        child: TextFormField(
          controller: _passcontroller,
          obscureText: true,
          validator: (value) {
            if (value!.isEmpty) {
              return kChamVide;
            }
            return null;
          },
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              hintText: "Enter votre Mot de passe",
              hintStyle: TextStyle(color: Colors.black38),
              prefixIcon: Icon(
                Icons.lock,
                color: kPrimaryGreenButton,
              )),
        ),
      )
    ],
  );
}

Widget builForgetPassword() {
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () {},
      child: Text(
        "mot de passe oublier",
        style: TextStyle(color: kPrimaryText, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget builName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Name",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: kPrimaryText,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 65,
        child: TextFormField(
          controller: _namecontroller,
          validator: (value) {
            if (value!.isEmpty) {
              return kChamVide;
            }
            return null;
          },
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Enter votre nom",
              hintStyle: TextStyle(color: Colors.black38),
              prefixIcon: Icon(
                Icons.person,
                color: kPrimaryGreenButton,
              )),
        ),
      )
    ],
  );
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^[a-zA-Z-0-9]+[\_\-\.]*[a-zA-Z-0-9]+[@][a-zA-Z-0-9]{2,}[\.]([a-zA-Z-0-9]{2,3})')
        .hasMatch(this);
  }
}
