// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/forgot_password/forgot_password.dart';
import 'package:ikirengaauto/home/homepage.dart';
import 'package:ikirengaauto/widget/first_Text.dart';
import 'package:ikirengaauto/widget/loginwidget.dart';
import 'package:page_transition/page_transition.dart';
import '../Registration/registration.dart';
import '../widget/password_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 150.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 2,
        leadingWidth: 50,
        leading: const Padding(
          padding: EdgeInsets.only(left:20.0),
          child: Image(
            image: AssetImage('assets/icons/location.png'),
            semanticLabel: 'location',
            color: Colors.amberAccent,
          ),
        ),
        title: const Text(
          'Kigali, Rwanda',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              FirstText(
                  firstText: 'Let\'s Sign You In',
                  secondText: 'Welcome back, you\'ve been missed!'),
              SizedBox(height: 30.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  const Text(
                    'Username or Email',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  LoginWidget(),
                  SizedBox(height: 40.h),
                  const Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const PasswordWidget(),
                  SizedBox(height: 5.h),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const ForgotPassword(),
                              type: PageTransitionType.rightToLeftWithFade));
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 160.h),
          Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFFFFDB47),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const HomePage(ordersCount: 0,),
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
                            'SIGN IN',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: const Image(
                            image: AssetImage('assets/icons/log-in.png'),
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
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const SignUp(),
                              type:
                              PageTransitionType.rightToLeftWithFade));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text(
              //       'or',
              //       style: TextStyle(
              //         color: Colors.black26,
              //         fontSize: 14,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     TextButton(
              //       onPressed: () {
              //         Navigator.push(
              //             context,
              //             PageTransition(
              //                 child: const SignUp(),
              //                 type:
              //                 PageTransitionType.rightToLeftWithFade));
              //       },
              //       child: const Text(
              //         'Skip',
              //         style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 14,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

            ],
          )
                ],
              ),
          ),
        ),
    );
  }
}
