import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ikirengaauto/Ikirenga_icons.dart';
import 'package:ikirengaauto/productpages/garage.dart';
import 'package:ikirengaauto/productpages/spareparts.dart';
import 'package:ikirengaauto/productpages/usedcar.dart';
import 'package:page_transition/page_transition.dart';
import '../cart/my_cart.dart';
import '../productpages/mechanics.dart';

import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final screens = [
    const Home(),
    const UsedCars(),
    const SpareParts(),
    const GaragePage(),
    const Mechanics(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GNav(
            tabBorderRadius: 50,
            tabMargin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.yellow,
            iconSize: 25,
            gap: 5,
            tabs: const [
              GButton(
                icon: Ikirenga.home,
                text: 'Home',
              ),
              GButton(
                icon: Ikirenga.carfix,
                text: 'Used Cars',
              ),
              GButton(
                icon: Ikirenga.fix,
                text: 'Spare parts',
              ),
              GButton(
                icon: Ikirenga.toolkit,
                text: 'Garages',
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
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                  child: const MyCart(), type: PageTransitionType.fade),
            );
          },
          child: const Icon(
            Icons.shopping_bag_outlined,
            size: 30,
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit the app?'),actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              SystemNavigator.pop(); // exit the app
            },
            child: const Text('Yes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black54),),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
          ),

        ],
      ),
    )) ??
        false;
  }
}
