import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/container_model.dart';

class Cars extends StatelessWidget {
  final UsedCarsModel usedCarsModel;
  final Function()? onTap;
  const Cars({
    super.key,
    required this.onTap,
    required this.usedCarsModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        SizedBox(
          height: MediaQuery.of(context).size.width / 4,
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          child: Image.network(
            usedCarsModel.image,
            fit: BoxFit.cover,
          ),),
        ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              usedCarsModel.title,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Rwf ${usedCarsModel.price}',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
