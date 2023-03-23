// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstText extends StatelessWidget {
  final String firstText;
  final String secondText;
  String? thirdText;
  FirstText(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.thirdText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstText,
          style: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15.h),
        Text(
          secondText,
          style: const TextStyle(
            color: Colors.black38,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
