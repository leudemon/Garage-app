import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/country_locator/country_locator.dart';
import 'package:ikirengaauto/otp/otp_screen.dart';
import 'package:ikirengaauto/widget/first_Text.dart';
import 'package:ikirengaauto/widget/loginwidget.dart';
import 'package:page_transition/page_transition.dart';

import '../Login/login.dart';
import '../home/homepage.dart';
import '../widget/password_widget.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 2,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Image(
            image: AssetImage('assets/icons/location.png'),
            semanticLabel: 'location',
            color: Colors.amberAccent,
          ),
        ),
        title: const Text(
          'Kigali, Rwanda',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FirstText(
                      firstText: 'Gettting Started',
                      secondText: 'Create an account to continue!'),
                  SizedBox(height: 30.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Phone Number',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      const CountryLocator(),
                      SizedBox(height: 50.h),
                      LoginWidget(
                        icon: Icons.check,
                      ),
                      SizedBox(height: 50.h),
                      const PasswordWidget(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.check_box,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    'By creating an account, you agree to our',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const Text('Term & Conditions',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    )),


                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
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
                                        child: const OtpScreen(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade));
                              },
                              child: Row(
                                children: [
                                  const Spacer(),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'SIGN UP',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: const Image(
                                        image: AssetImage(
                                            'assets/icons/log-in.png'),
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an Account?',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const LoginPage(),
                                      type: PageTransitionType
                                          .rightToLeftWithFade));
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),


                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const HomePage(),
                                    type:
                                    PageTransitionType.rightToLeftWithFade));
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
