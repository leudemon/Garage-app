import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import 'cart_container.dart';
import 'order_review/order_review.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_backspace_outlined,
                color: Colors.black,
                size: 30,
              )),
          title: Center(
            child: Text(
              'MY CART',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                  size: 30,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const CarContainer(
                          title: 'Window Motor',
                          subTitle: 'BLACK',
                          price: '80, 000 Rwf',
                          image: 'assets/images/imput_image2.png'),
                      SizedBox(height: 10.h),
                      const CarContainer(
                          title: 'Power Steering Pump',
                          subTitle: 'BLACK',
                          price: '200, 000 Rwf',
                          image: 'assets/images/imput_image3.png'),
                      SizedBox(height: 10.h),
                      const CarContainer(
                          title: 'Window Motor',
                          subTitle: 'BLACK',
                          price: '80, 000 Rwf',
                          image: 'assets/images/imput_image4.png'),
                      SizedBox(height: 10.h),
                      const CarContainer(
                          title: 'Power Steering Pump',
                          subTitle: 'BLACK',
                          price: '200, 000 Rwf',
                          image: 'assets/images/imput_image_one.png'),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400)),
                        Text('360, 000 Rwf',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 20.h),
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
                                      child: const OrderReview(),
                                      type: PageTransitionType.rightToLeft));
                            },
                            child: Row(
                              children: [
                                const Spacer(),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'CHECKOUT',
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
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
