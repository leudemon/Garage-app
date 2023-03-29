import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:ikirengaauto/productpages/spareparts.dart';
import 'package:ikirengaauto/productpages/usedcar.dart';
import 'package:ikirengaauto/widget/item_container.dart';
import 'package:page_transition/page_transition.dart';

import '../productpages/mechanics.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),
          ),

           Padding(
           padding: const EdgeInsets.all(10.0),
           child:  Expanded(
           child: Column(

                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Colors.grey,
                      size: 150.h,
                    )
                  ],
                ),
              )
           ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                   Expanded(

                     child: Column(
                       children: const [
                            Text(
                              'Bios',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                            )
                       ],
                     )

                  )
                ],
              )

            ),
          ),
        ],
      ),
    );
  }
}