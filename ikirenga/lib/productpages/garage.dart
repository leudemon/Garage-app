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
      appBar: AppBar(
        title: const Text(
          'Welcome Back',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
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