import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/model/container_model.dart';

class SpartPartCars extends StatelessWidget {
  final SparePartsModel sparePartsModel;
  final Function()? onTap;
  const SpartPartCars({super.key, required this.sparePartsModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Image.asset(
              sparePartsModel.image,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              sparePartsModel.title,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              sparePartsModel.price,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
