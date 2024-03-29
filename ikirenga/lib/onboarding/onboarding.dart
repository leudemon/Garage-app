// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:ikirengaauto/home/homepage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/services.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List images = [
    'assets/images/onboarding1.png',
  ];
  int currentPage = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Make system UI and navigation bar transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }


  @override
  void dispose() {
    _pageController!.dispose();

    // Restore system UI and navigation bar colors
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: Column(children: [
                    Image.asset(
                      images[0],
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
                        'With long experience in the industry,\n we create the best quality products',
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
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xFFFFDB47),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const HomePage(),
                                  type:
                                      PageTransitionType.rightToLeftWithFade));
                        },
                        child: Row(
                          children: [
                            const Spacer(),
                            Container(
                              alignment: Alignment.center,
                              child: const Text(
                                'GET STARTED',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),


                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: const Image(
                                  image: AssetImage(
                                      'assets/icons/arrow-right.png'),
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                const Spacer(),

              ]),

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
