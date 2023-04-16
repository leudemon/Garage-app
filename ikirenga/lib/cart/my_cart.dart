import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../model/viewmodel/sparepart_cartmodel.dart';
import 'cart_container.dart';
import 'order_review/order_review.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

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
          title: Text(
            'MY CART',
            style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,

        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SafeArea(
            child: Consumer<CartModel>(
              builder: (context, value, child) => Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.cartItems.length,
                        itemBuilder: (context, index) {
                          // return Text(value.cartItems[index].item.title);
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: CartContainer(
                              item: value.cartItems[index].item,
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400)),
                          Text('${value.calculateTotal()} RWF',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: const Color(0xFFFFDB47),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              onPressed: () {
                                final total = value.calculateTotal();
                                const itemName = '';
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: OrderReview(purchasedItem: itemName, Itemprice: total,),
                                        type: PageTransitionType.fade));
                              },
                              child: Row(
                                children: [
                                  const Spacer(),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'CHECKOUT',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: const Image(
                                        image: AssetImage(
                                            'assets/icons/arrow-right.png'),
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

}

