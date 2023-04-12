import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import 'widget/garage_single_detail/garage_single.dart';
import 'widget/home_container.dart';

class GaragePage extends StatelessWidget {
  const GaragePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  HomeContainer(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const GarageSingle(),
                              type: PageTransitionType.rightToLeft));
                    },
                    title: 'OIL REPLACEMENT',
                    image: 'assets/images/imput_image5.png',
                  ),
                  SizedBox(height: 1.h),
                  HomeContainer(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const GarageSingle(),
                              type: PageTransitionType.rightToLeft));
                    },
                    title: 'ENGINE OIL FILTER',
                    image: 'assets/images/imput_image5.png',
                  ),
                  SizedBox(height: 1.h),
                  HomeContainer(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const GarageSingle(),
                              type: PageTransitionType.rightToLeft));
                    },
                    title: 'ENGINE CHECK UP',
                    image: 'assets/images/imput_image5.png',
                  ),
                  SizedBox(height: 1.h),
                  HomeContainer(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const GarageSingle(),
                              type: PageTransitionType.rightToLeft));
                    },
                    title: 'ENGINE OIL REFILL',
                    image: 'assets/images/imput_image5.png',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
