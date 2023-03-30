import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  const HomeContainer(
                    title: 'OIL REPLACEMENT',
                    image: 'assets/images/imput_image5.png',
                  ),
                  SizedBox(height: 5.h),
                  const HomeContainer(
                    title: 'ENGINE OIL FILTER',
                    image: 'assets/images/imput_image5.png',
                  ),
                  SizedBox(height: 5.h),
                  const HomeContainer(
                    title: 'ENGINE CHECK UP',
                    image: 'assets/images/imput_image5.png',
                  ),
                  SizedBox(height: 5.h),
                  const HomeContainer(
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
