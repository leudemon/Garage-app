import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:ikirengaauto/model/viewmodel/usedcars_cartmodel.dart';
import 'package:provider/provider.dart';

class SingleCarDetail extends StatelessWidget {
  final UsedCarsModel usedCarsModel;
  const SingleCarDetail({super.key, required this.usedCarsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_backspace_outlined,
              color: Colors.black,
              size: 30,
            )),
        title: Center(
          child: Text(
            '',
            style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [Image.asset('assets/icons/filter.jpg')],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        usedCarsModel.image,
                        height: 250.h,
                        width: 300.w,
                      ),
                      Text(usedCarsModel.title,
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10.h),
                      Text('Rwf ${usedCarsModel.price}',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400)),
                    ],
                  )),
              SizedBox(height: 40.h),
              Text('Compressor',
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Condition:',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 5.w),
                        Text('Used',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black45,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Text('Vehicle Type:',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 5.w),
                        Text('Sedan',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black45,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Text('Make:',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 5.w),
                        Text('Audi',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black45,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Text('Model:',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 5.w),
                        Text('A4(B9)',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black45,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Text('Transmission:',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 5.w),
                        Text('Automatic',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black45,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Text('Fuel Type:',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 5.w),
                        Text('Disel',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black45,
                            ))
                      ],
                    ),
                    const Spacer(),
                    Consumer<UsedCarsCartModel>(
                      builder: (context, value, child) {
                        return Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xFFFFDB47),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 120, vertical: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {
                              Provider.of<UsedCarsCartModel>(context,
                                      listen: false)
                                  .addToCart(usedCarsModel);
                            },
                            child: const Text('ADD TO CART',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.black)),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
