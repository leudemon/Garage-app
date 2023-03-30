// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/container_model.dart';

class ItemContainer extends StatelessWidget {
  final ContainerModel containerModel;
  final Function()? onTap;
  const ItemContainer({
    super.key,
    required this.onTap,
    required this.containerModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Image.asset(
            containerModel.image,
            fit: BoxFit.cover,
            width: 150
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            children: [
              Text(
                containerModel.title,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                containerModel.subtitle!,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 5.h,
              ),
              TextButton(
                  onPressed: onTap,
                  child: Text(
                    'viewmore',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w200,
                        color: Colors.black),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
