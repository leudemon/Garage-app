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
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset(
              'assets/icons/log-in.png',
              scale: 2,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle,
                color: Colors.black,
              )),
        ],
      ),
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
                  SizedBox(height: 5.h),
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
                  SizedBox(height: 5.h),
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
                  SizedBox(height: 5.h),
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
