import 'package:flutter/material.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:ikirengaauto/productpages/widget/car_details/single_car_detail.dart';
import 'package:page_transition/page_transition.dart';

import 'widget/cars.dart';

class UsedCars extends StatefulWidget {
  const UsedCars({super.key});

  @override
  State<UsedCars> createState() => _UsedCarsState();
}

class _UsedCarsState extends State<UsedCars> {
  List<UsedCarsModel> searchList = [];
  List<UsedCarsModel> usedCarModel = [
    UsedCarsModel(
        ontap: (BuildContext context) {
          Navigator.push(
              context,
              PageTransition(
                  child: const SingleCarDetail(),
                  type: PageTransitionType.rightToLeftWithFade));
        },
        title: 'Audi e45 2019',
        image: 'assets/images/carimagefour.png',
        price: '140,000 Rwf'),
    UsedCarsModel(
        ontap: (BuildContext context) {
          Navigator.push(
              context,
              PageTransition(
                  child: const SingleCarDetail(),
                  type: PageTransitionType.rightToLeftWithFade));
        },
        title: 'Car Name',
        image: 'assets/images/carimagefour.png',
        price: '100,000 Rwf'),
    UsedCarsModel(
        ontap: (BuildContext context) {
          Navigator.push(
              context,
              PageTransition(
                  child: const SingleCarDetail(),
                  type: PageTransitionType.rightToLeftWithFade));
        },
        title: 'Car Name',
        image: 'assets/images/carimagefour.png',
        price: '80,000 Rwf'),
    UsedCarsModel(
        ontap: (BuildContext context) {
          Navigator.push(
              context,
              PageTransition(
                  child: const SingleCarDetail(),
                  type: PageTransitionType.rightToLeftWithFade));
        },
        title: 'Car Name',
        image: 'assets/images/carimagefour.png',
        price: '38,000 Rwf'),
    UsedCarsModel(
        ontap: (BuildContext context) {
          Navigator.push(
              context,
              PageTransition(
                  child: const SingleCarDetail(),
                  type: PageTransitionType.rightToLeftWithFade));
        },
        title: 'Car Name',
        image: 'assets/images/carimagefour.png',
        price: '140,000 Rwf'),
    UsedCarsModel(
        ontap: (BuildContext context) {
          Navigator.push(
              context,
              PageTransition(
                  child: const SingleCarDetail(),
                  type: PageTransitionType.rightToLeftWithFade));
        },
        title: 'Car Name',
        image: 'assets/images/carimagefour.png',
        price: '80,000 Rwf'),
  ];
  void search(String searchString) {
    setState(() {
      searchList = usedCarModel
          .where(
              (element) => element.title.toLowerCase().contains(searchString))
          .toList();
    });
  }

  @override
  void initState() {
    search('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 70,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   leading: IconButton(
      //     onPressed: () => Navigator.pop(context),
      //     icon: const Padding(
      //       padding: EdgeInsets.only(left: 15),
      //       child:  Icon(
      //         Icons.arrow_back_ios_new_outlined,
      //         color: Colors.black,
      //       ),
      //     )
      //   ),
      //   leadingWidth: 40,
      //   titleSpacing: 0,
      //   centerTitle: false,
      //   title: Container(
      //     margin: const EdgeInsets.all(30),
      //     decoration: BoxDecoration(
      //       color: Colors.grey[300],
      //       borderRadius: BorderRadius.circular(15),
      //     ),
      //     child: TextField(
      //       onChanged: (value) => search(value),
      //       decoration: const InputDecoration(
      //         border: InputBorder.none,
      //         prefixIcon: Icon(Icons.search),
      //         hintText: 'Search',
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0),
                itemBuilder: ((context, index) => Cars(
                      usedCarsModel: searchList[index],
                      onTap: () => searchList[index].ontap!(context),
                    )),
                itemCount: searchList.length,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
