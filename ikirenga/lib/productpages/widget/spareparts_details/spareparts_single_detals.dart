import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SparePartSingleDetail extends StatelessWidget {
  const SparePartSingleDetail({super.key});

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
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.email_sharp,
                color: Colors.black,
                size: 20.sp,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Spare Part',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Compressor',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 70.h),
                        Text(
                          'From',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '200,000 Rwf',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 70.h),
                        Text(
                          'subscribe for',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/bmw1.jpg',
                                width: 50, height: 50),
                            Image.asset('assets/images/bmw.jpg',
                                width: 50, height: 50),
                            Image.asset('assets/images/toyota.jpg',
                                width: 50, height: 50),
                          ],
                        )
                      ],
                    ),
                    Image.asset(
                      'assets/images/spare.png',
                      width: 200,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Column(
                  children: [
                    Text('Compressor',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'The idling device of the compressor 1.18493 controls the flow rate if less air is required.'
                        'A feed pump can be flanged directly to the compressor. The crankshaft is forged. All highly stressed surfaces are induction hardened to minimize wear.'
                        'The connecting rods are made of die-cast aluminum. Valve reeds are made of a special flexible stainless steel. All of these measures significantly increase the service life of the compressor',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFFFFDB47),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  child: const Text('ADD TO CART',
                      style: TextStyle(fontSize: 16, color: Colors.black))),
            ],
          ),
        ),
      ),
    );
  }
}
