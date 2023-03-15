import 'package:flutter/material.dart';

//import '../routes/routes.dart';
//import '../demarage_application/splash_screen.dart';
import 'package:parent_school_followup/constant.dart';
import 'package:parent_school_followup/home/acceuil.dart';
import 'package:parent_school_followup/home/page%20acceuil/presentation.dart';


class HomeNavigation extends StatefulWidget {
  static String routeName = '/HomeNavigation';

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _selectIndex = 0;
  final List<Widget> _tabs =  [
  
    AceuilScrenn(),
   const  Center(
      child: Text('FGDFG'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ici on n'appelle notre tableau qui va permettre de changer
      // de page dynamiquement
      body: _tabs[_selectIndex],

      // on define notre bottom navigation bar

      bottomNavigationBar: BottomNavigationBar(
        
        // attribut de la bottom navigation bar
        elevation: 2,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: kPrimaryColorIcon,
        currentIndex: _selectIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        // une methode pour pouvoir selectionner et deselectionner
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
      ),
    );
  }
}
