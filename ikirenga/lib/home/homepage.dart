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
    const Center(child: Text('Profile')),
    const Center(child: Text('Car')),
    const Center(child: Text('Search')),
    const Center(child: Text('Settings')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: GNav(
          tabBorderRadius: 20,
          padding: const EdgeInsets.all(20),
          color: Colors.black,
          activeColor: Colors.black,
          tabBackgroundColor: Colors.yellow.shade600.withOpacity(0.8),
          iconSize: 20,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.account_circle,
              text: 'Profile',
            ),
            GButton(
              icon: Icons.car_crash,
              text: 'Car',
            ),
            GButton(
              icon: Icons.addchart,
              text: 'Search',
            ),
            GButton(icon: Icons.settings, text: 'Settings')
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
