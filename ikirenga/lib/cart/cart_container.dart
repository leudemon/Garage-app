import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../model/viewmodel/sparepart_cartmodel.dart';

class CartContainer extends StatefulWidget {
  final Item item;
  // final int quantity;
  const CartContainer({
    super.key,
    required this.item,
  });

  @override
  State<CartContainer> createState() => _CartContainerState();
}

class _CartContainerState extends State<CartContainer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
          SizedBox(
          height: MediaQuery.of(context).size.width/4,
          width: MediaQuery.of(context).size.width/3,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15),),
            child: Image.network(
              widget.item.image,
              fit: BoxFit.cover,
            ),),),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.item.title,
                            softWrap: true,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20.sp)),
                        SizedBox(width: 15.w),
                        IconButton(
                            onPressed: () {
                              Provider.of<CartModel>(context, listen: false)
                                  .removeFromCart(widget.item);
                            },
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: Colors.black,
                              size: 25.sp,
                            ))
                      ],
                    ),
                    SizedBox(width: 10.w),
                    SizedBox(height: 5.h),

                    SizedBox(height: 5.h),
                    Text('Rwf ${widget.item.price}',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false)
                                .decreaseQuantity(widget.item);
                          },
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
                          child: Text(
                              Provider.of<CartModel>(context, listen: false)
                                  .getCartItemQuantity(widget.item)
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(width: 10.w),
                        IconButton(
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false)
                                .addToCart(widget.item);
                          },
                          icon: const Icon(Icons.add),
                        ),
                        SizedBox(width: 5.w),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
