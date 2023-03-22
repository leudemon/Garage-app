// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:ikirengaauto/Login/login.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List images = [
    'assets/images/onboarding1.png',
    'assets/images/onboarding1.png',
    'assets/images/onboarding1.png',
  ];
  int currentPage = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(children: [
                    Image.asset(
                      images.length > i ? images[i] : images[0],
                      width: double.infinity,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          images.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Welcome to IKIRENGA AUTO!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40.0, vertical: 5),
                      child: Text(
                        'With long experience in the audio industry,\n we create the best quality products',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFDB47),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const LoginPage(),
                                type: PageTransitionType.rightToLeftWithFade));
                      },
                      child: const Text('GET STARTED',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    )
                  ]);
                },
              ),
            ),
          ],
        ));
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentPage == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFFFDB47),
      ),
    );
  }
}
