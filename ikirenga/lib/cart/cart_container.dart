import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarContainer extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;
  final String price;
  const CarContainer(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.price});

  @override
  State<CarContainer> createState() => _CarContainerState();
}

class _CarContainerState extends State<CarContainer> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(widget.image),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Text(widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20.sp)),
              SizedBox(height: 5.h),
              Text(widget.subTitle,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 5.h),
              Text(widget.price,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: _decrementCounter,
                    icon: const Icon(Icons.remove),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('$_counter',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    onPressed: _incrementCounter,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
