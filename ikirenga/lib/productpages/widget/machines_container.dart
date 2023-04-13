import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/productpages/mechanics.dart';
import 'package:ikirengaauto/model/container_model.dart';


class MachanicsContainer extends StatelessWidget {
  final MechanicsModel mechanicsModel;
  final Function()? onTap;
  const MachanicsContainer({super.key, required this.onTap, required this.mechanicsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Professinal Mechanic',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.network(
                        mechanicsModel.image,
                        height: 100,
                        width: 145,
                        scale: 2,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mechanicsModel.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              mechanicsModel.location,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              mechanicsModel.phone,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'email: machanic@gmail.com',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/images/garages.png',
                                    height: 30, width: 40),
                                SizedBox(width: 10.w),
                                const Text(
                                  'Rating here',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ])
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
