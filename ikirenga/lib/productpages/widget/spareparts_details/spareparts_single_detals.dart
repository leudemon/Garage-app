import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:ikirengaauto/model/viewmodel/sparepart_cartmodel.dart';
import 'package:provider/provider.dart';

class SparePartSingleDetail extends StatelessWidget {
  final SparePartsModel sparePartsModel;
  const SparePartSingleDetail({super.key, required this.sparePartsModel});

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
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
                size: 20.sp,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Spare Part',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          sparePartsModel.title,
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 70.h),
                        Text(
                          'From',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Rwf ${sparePartsModel.price}',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'subscribe for',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/bmw1.jpg',
                                width: 50, height: 50),
                            Image.asset('assets/images/bmw.jpg',
                                width: 50, height: 50),
                            Image.asset('assets/images/toyota.jpg',
                                width: 50, height: 50),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width /2,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(15),),
                        child: Image.network(
                          sparePartsModel.image,
                          width: 200,
                          fit: BoxFit.cover,
                        ),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Column(
                  children: [
                    Text(sparePartsModel.title,
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        sparePartsModel.description,
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Consumer<CartModel>(
                builder: (context, value, child) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xFFFFDB47),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 120, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addToCart(Item(
                                title: sparePartsModel.title,
                                image: sparePartsModel.image,
                                description: sparePartsModel.description,
                                price: sparePartsModel.price));
                      },
                      child: const Text('ADD TO CART',
                          style: TextStyle(fontSize: 16, color: Colors.black)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
