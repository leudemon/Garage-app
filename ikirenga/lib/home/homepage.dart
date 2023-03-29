import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    const Center(child: Text('Used Cars')),
    const Center(child: Text('Spare Parts')),
    const Center(child: Text('Mechanics')),
    const Center(child: Text('Settings'))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(25, 1, 25, 35),
        child: GNav(
          tabBorderRadius: 50,
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 7),
          color: Colors.black,
          activeColor: Colors.black,
          tabBackgroundColor: Colors.yellow,
          iconSize: 30,
          gap: 5,
          duration: const Duration(microseconds: 5000),
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

              icon: Icons.person_4_outlined,
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
    );
  }
}
