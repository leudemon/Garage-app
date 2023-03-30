import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/productpages/widget/machines_container.dart';
import 'package:page_transition/page_transition.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Orders',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list_outlined,
                color: Colors.black,
              )),
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20,25,20, 0),
          child: SafeArea(
            child: ListView(
              children: const [
                Text('orders'),
                SizedBox(height: 10,),
                Text('orders'),
                SizedBox(height: 10,),
                Text('orders'),
                SizedBox(height: 10,),
                Text('orders'),
                SizedBox(height: 10,),
                Text('orders'),
              ],
            ),
          ),
        ));
  }
}
