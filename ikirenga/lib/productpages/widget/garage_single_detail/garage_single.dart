import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/model/container_model.dart';

class GarageSingle extends StatefulWidget {
  final GaragesModel garagesModel;
  const GarageSingle({super.key, required this.garagesModel});

  @override
  State<GarageSingle> createState() => _GarageSingleState();
}

class _GarageSingleState extends State<GarageSingle> {
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
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.network(
                  widget.garagesModel.image,
                  height: 300.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30.h),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        widget.garagesModel.service,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        widget.garagesModel.description,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      const Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFFFFDB47),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 150, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {},
                          child: const Text('BOOK',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
