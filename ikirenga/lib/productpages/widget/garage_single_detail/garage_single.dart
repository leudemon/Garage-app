import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GarageSingle extends StatelessWidget {
  const GarageSingle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_backspace_outlined,
                color: Colors.black,
                size: 30.sp,
              )),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset(
                  'assets/images/garage.jpg',
                  height: 300.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30.h),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Oil and oil filter check and replacement',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'An oil and filter change extends the lifespan of '
                        'your car. You should book an oil change regularly to keep your car in top condition.'
                        'A small expense now can save you forking out for much larger car repairs in the future.'
                        'If there isn\'t enough oil in your car, or the oil is dirty, you run the risk of severe engine problems and seeing the dreaded red engine management light.',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      const Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFFFFDB47),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 150, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {},
                          child: const Text('BOOK',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
