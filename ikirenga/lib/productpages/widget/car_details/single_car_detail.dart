import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleCarDetail extends StatefulWidget {
  const SingleCarDetail({super.key});

  @override
  State<SingleCarDetail> createState() => _SingleCarDetailState();
}

class _SingleCarDetailState extends State<SingleCarDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: const Text(
          'CAR > AUDI',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list,
                color: Colors.black,
              )),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/images/carimagefour.png',
                          height: 200.h, width: 200.w),
                      Text('Audi e45',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10.h),
                      Text('Sedan',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              SizedBox(height: 10.h),
              Text('Compressor',
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Condition: Used',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.h),
                    Text('Vechicle Type: Sedan',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.h),
                    Text('Make: Audi',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.h),
                    Text('Model: A4(B9)',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.h),
                    Text('Transmission: Automatic',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5.h),
                    Text('Fuel Type: Diesel',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 50.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFDB47),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 120, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {},
                      child: const Text('ADD TO CART',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
