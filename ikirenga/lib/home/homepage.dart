import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ikirengaauto/ikirenga_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ikirengaauto/productpages/spareparts.dart';
import 'package:ikirengaauto/productpages/usedcar.dart';
import '../productpages/garage.dart';
import '../productpages/mechanics.dart';
import '../productpages/orders.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final screens = [
    const Home(),
    const SpareParts(),
    const UsedCars(),
    const GaragePage(),
    const Mechanics(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 30, 45),
        child: GNav(
          tabBorderRadius: 50,
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 7),
          color: Colors.black,
          activeColor: Colors.black,
          tabBackgroundColor: Colors.yellow,
          iconSize: 25,
          gap: 5,
          // duration: const Duration(microseconds: 10000),
          tabs:  const[
            GButton(
              icon: Ikirenga.home,
              text: 'Home',
            ),
            GButton(

              icon: Ikirenga.fix,
              text: 'Spare Parts',
            ),
            GButton(

              icon: Ikirenga.carfix,
              text: 'Used Cars',
            ),
            GButton(

              icon: Ikirenga.toolkit,
              text: '  Garages',
            ),
            GButton(

              icon: Ikirenga.mechanic,
              text: 'Mechanics',
            ),

          ],
          selectedIndex: _currentIndex,
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      body: screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              PageTransition(
                  child: const Orders(),
                  alignment: Alignment.center,
                  type: PageTransitionType.fade));
        },
        child: const Icon(Icons.shopping_bag_outlined,),
      ),
    );
  }
}
