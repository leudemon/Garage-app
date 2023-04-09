import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ikirengaauto/home/profile.dart';
import 'package:ikirengaauto/productpages/spareparts.dart';
import 'package:ikirengaauto/productpages/usedcar.dart';
import 'package:page_transition/page_transition.dart';
import '../cart/my_cart.dart';
import '../productpages/mechanics.dart';

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
    const UsedCars(),
    const SpareParts(),
    const Mechanics(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 30, 45),
        child: GNav(
          tabBorderRadius: 50,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
          color: Colors.black,
          activeColor: Colors.black,
          tabBackgroundColor: Colors.yellow,
          iconSize: 30,
          // gap: 5,
          // duration: const Duration(microseconds: 10000),
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.car_repair_outlined,
              text: 'Used Cars',
            ),
            GButton(
              icon: Icons.settings_applications_outlined,
              text: 'Spare parts',
            ),
            GButton(
              icon: Icons.accessibility_outlined,
              text: 'Mechanics',
            ),
            GButton(
              icon: Icons.person_outline_outlined,
              text: 'Profile',
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
                  child: const MyCart(), type: PageTransitionType.fade));
        },
        child: const Icon(
          Icons.shopping_bag_outlined,
        ),
      ),
    );
  }
}
