import 'package:flutter/material.dart';
import 'package:ikirengaauto/productpages/widget/spare_parts.dart';

import '../model/container_model.dart';

class SpareParts extends StatefulWidget {
  const SpareParts({super.key});

  @override
  State<SpareParts> createState() => _SparePartsState();
}

class _SparePartsState extends State<SpareParts> {
  List<SparePartsModel> searchList = [];
  List<SparePartsModel> sparePartsModel = [
    SparePartsModel(
        ontap: (BuildContext context) {},
        title: 'Engine Pistons',
        image: 'assets/images/imput_image_one.png',
        price: '21,000,000 Rwf'),
    SparePartsModel(
        ontap: (BuildContext context) {},
        title: 'Brake Caliper',
        image: 'assets/images/imput_image2.png',
        price: '100,000 Rwf'),
    SparePartsModel(
        ontap: (BuildContext context) {},
        title: 'Window Motor',
        image: 'assets/images/imput_image3.png',
        price: '34,000,000 Rwf'),
    SparePartsModel(
        ontap: (BuildContext context) {},
        title: 'Wheel bearing',
        image: 'assets/images/imput_image4.png',
        price: '38,000,000 Rwf'),
    SparePartsModel(
        ontap: (BuildContext context) {},
        title: 'Engine Pistons',
        image: 'assets/images/imput_image_one.png',
        price: '32,000,000, Rwf'),
    SparePartsModel(
        ontap: (BuildContext context) {},
        title: 'Window Motor',
        image: 'assets/images/imput_image3.png',
        price: '80,000,000 Rwf'),
  ];
  void search(String searchString) {
    setState(() {
      searchList = sparePartsModel
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              onChanged: (value) => search(value),
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: ((context, index) => SpartPartCars(
                      sparePartsModel: searchList[index],
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
