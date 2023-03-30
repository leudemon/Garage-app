import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/productpages/widget/machines_container.dart';
import 'package:page_transition/page_transition.dart';

import 'widget/single_service_detail.dart';

class Mechanics extends StatefulWidget {
  const Mechanics({super.key});

  @override
  State<Mechanics> createState() => _MechanicsState();
}

class _MechanicsState extends State<Mechanics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Padding(
      padding: const EdgeInsets.only(top: 25),
      child: SafeArea(
        child: ListView(
          children: [
            MachanicsContainer(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: const SingleServicedetail(),
                      type: PageTransitionType.rightToLeftWithFade),
                );
              },
            ),
            SizedBox(height: 10.h),
            MachanicsContainer(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: const SingleServicedetail(),
                      type: PageTransitionType.rightToLeftWithFade),
                );
              },
            ),
            SizedBox(height: 10.h),
            MachanicsContainer(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: const SingleServicedetail(),
                      type: PageTransitionType.rightToLeftWithFade),
                );
              },
            ),
            SizedBox(height: 10.h),
            MachanicsContainer(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: const SingleServicedetail(),
                      type: PageTransitionType.rightToLeftWithFade),
                );
              },
            ),
            SizedBox(height: 10.h),
            MachanicsContainer(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: const SingleServicedetail(),
                      type: PageTransitionType.rightToLeftWithFade),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
