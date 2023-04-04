import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/car_widget.dart';
import 'widget/cart_list.dart';
import 'widget/paymet_container.dart';

class OrderReview extends StatelessWidget {
  const OrderReview({super.key});

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
                size: 20,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Cars',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Colors.black,
                        size: 30.sp,
                      )),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const CarWidget(),
                    SizedBox(
                      width: 5.w,
                    ),
                    const CarWidget(),
                    SizedBox(
                      width: 5.w,
                    ),
                    const CarWidget(),
                    SizedBox(
                      width: 5.w,
                    ),
                    const CarWidget(),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text('ORDER VIA',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Icons.call, color: Colors.green),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('WhatsApp',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFDB47),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text('Change',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const CartList(),
              SizedBox(
                height: 20.h,
              ),
              Text('PAYMENT',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: 10.h,
              ),
              const PaymentContainer(),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shippig',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400)),
                  Text('free',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400)),
                  Text('16,000,000 Rwf',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xFFFFDB47),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                'PLACE ORDER',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: const Image(
                                image:
                                    AssetImage('assets/icons/arrow-right.png'),
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
          ),
        ),
      ),
    );
  }
}