import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double? height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.yellow[600],
          elevation: 0.0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Image.asset(
                'assets/icons/log-in.png',
                scale: 2,
              )),

        ),
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: height! * .5,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFFDB47),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Image.asset(
                    'assets/images/profile.png',
                    height: 100.h,
                    width: 100.w,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Severine',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'severin@gmail.com',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: height! * .25,
          left: width! * .1,
          child: Container(
            height: height! * .4,
            width: width! * .8,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    leading:
                        Icon(Icons.person, color: Colors.black54, size: 30.sp),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('My Account',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10.h),
                        Text(
                          'Edit your information',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
