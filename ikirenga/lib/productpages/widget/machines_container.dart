import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/productpages/mechanics.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MachanicsContainer extends StatelessWidget {
  final MechanicsModel mechanicsModel;
  final Function()? onTap;
  const MachanicsContainer({super.key, required this.onTap, required this.mechanicsModel});

  @override
  Widget build(BuildContext context) {
    final double rating;
    switch(mechanicsModel.rating) {
      case 'one': {
        rating = 1;
      }
      break;
      case 'two': {
        rating = 2;
      }
      break;
      case 'three': {
        rating = 3;
      }
      break;
      case 'four': {
        rating = 4;
      }
      break;
      case 'five': {
        rating = 5;
      }
      break;

      default: {
        rating = 1;
      }
      break;
    }
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Professional Mechanic',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Image.asset('assets/images/garages.png',
                          height: 30, width: 50)
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.network(
                        mechanicsModel.image,
                        height: 100,
                        width: 145,
                        scale: 2,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              mechanicsModel.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              mechanicsModel.location,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200),
                            ),
                            Text(
                              mechanicsModel.phone,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(children: [
                              Text('$rating'),
                              RatingBarIndicator(
                                  rating: rating,
                                  itemSize: 15,
                                  itemBuilder: (context, _)=> const Icon(Icons.star, color: Colors.amber,)
                              ),
                            ],)

                          ])
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
