import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:provider/provider.dart';

import '../../../model/viewmodel/sparepart_cartmodel.dart';

class SingleCarDetail extends StatefulWidget {
  final UsedCarsModel usedCarsModel;
  const SingleCarDetail({super.key, required this.usedCarsModel});

  @override
  State<SingleCarDetail> createState() => _SingleCarDetailState();
}

class _SingleCarDetailState extends State<SingleCarDetail> {
  List images = [
    'assets/images/carimagefour.png',
    'assets/images/carimagefour.png',
    'assets/images/carimagefour.png',
  ];
  int currentPage = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      // SystemUiOverlay.bottom,
    ]);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      systemNavigationBarColor: Colors.red,
    );
  }

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
            //child: Text(
            // '${widget.usedCarsModel.make} ${widget.usedCarsModel.model} ${widget.usedCarsModel.year}',
            //  style: TextStyle(
            //      fontSize: 18.sp,
            //      color: Colors.black,
            //      fontWeight: FontWeight.w400),
            // ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [Image.asset('assets/icons/filter.jpg')],
        ),
        // body: SafeArea(
        //   child: Padding(
        //     padding: const EdgeInsets.all(20.0),
        body: Column(children: [
          Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Column(
                      children: [
                        Image.asset(
                          images.length > i ? images[i] : images[0],
                          width: double.infinity,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              images.length,
                                  (index) => buildDot(index, context),
                            ),
                          ),
                        ),
                        // Container(
                        //     padding: const EdgeInsets.all(20),
                        //     width: double.infinity,
                        //     decoration: BoxDecoration(
                        //       color: Colors.grey[200],
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     child: Column(
                        //       children: [
                        //         Image.network(
                        //           widget.usedCarsModel.image,
                        //           height: 250.h,
                        //           width: 300.w,
                        //         ),
                        //         Text(widget.usedCarsModel.title,
                        //             style: TextStyle(
                        //                 fontSize: 25.sp,
                        //                 color: Colors.black,
                        //                 fontWeight: FontWeight.bold)),
                        //         SizedBox(height: 10.h),
                        //         Text('Rwf ${widget.usedCarsModel.price}',
                        //             style: TextStyle(
                        //                 fontSize: 20.sp,
                        //                 color: Colors.black54,
                        //                 fontWeight: FontWeight.w400)),
                        //       ],
                        //     )),
                        SizedBox(height: 40.h),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Center(
                                    child: Text('Condition:',
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(widget.usedCarsModel.condition,
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
                                  Text(widget.usedCarsModel.make,
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
                                  Text(widget.usedCarsModel.model,
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
                                  Text(widget.usedCarsModel.transmission,
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
                                  Text(widget.usedCarsModel.fuelType,
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.black45,
                                      ))
                                ],
                              ),
                              const Spacer(),
                              //make a button to add to cart
                              Consumer<CartModel>(
                                builder: (context, value, child) {
                                  return Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: const Color(0xFFFFDB47),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 120, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8)),
                                      ),
                                      onPressed: () {
                                        Provider.of<CartModel>(context,
                                            listen: false)
                                            .addToCart(Item(
                                            title: widget.usedCarsModel.title,
                                            image: widget.usedCarsModel.image,
                                            description: widget
                                                .usedCarsModel.condition,
                                            price:
                                            widget.usedCarsModel.price));
                                      },
                                      child: const Text('ADD TO CART',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.black)),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }))
        ]));
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentPage == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFFFDB47),
      ),
    );
  }
}
