import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
          leading: Icon(Icons.shopping_cart, color: Colors.black, size: 30.sp),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Text('+25078*****',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10.h,
              ),
              Text('On 15 December 2022',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          trailing: Icon(Icons.arrow_downward_outlined,
              color: Colors.black, size: 30.sp)),
    );
  }
}
