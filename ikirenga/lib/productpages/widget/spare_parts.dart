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
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 4,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Image.network(
                  sparePartsModel.image,
                  fit: BoxFit.cover,
                ),),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.h,),

                  Text(
                    sparePartsModel.title,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 5.h,),
                  Text(
                    'Rwf ${sparePartsModel.price}',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black54),
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
