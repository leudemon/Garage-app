import 'package:flutter/material.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:ikirengaauto/productpages/spareparts.dart';
import 'package:ikirengaauto/productpages/usedcar.dart';
import 'package:ikirengaauto/widget/item_container.dart';
import 'package:page_transition/page_transition.dart';

import '../productpages/garage.dart';
import '../productpages/professional_machanics.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ContainerModel> searchList = [];
  List<ContainerModel> containerModel = [
    ContainerModel(
      ontap: (BuildContext context) {
        Navigator.push(
            context,
            PageTransition(
                child: const SpareParts(),
                type: PageTransitionType.rightToLeftWithFade));
      },
      title: 'Spare',
      subtitle: 'Parts',
      image: 'assets/images/spareparts.png',
    ),
    ContainerModel(
      ontap: (BuildContext context) {
        Navigator.push(
            context,
            PageTransition(
                child: const UsedCars(),
                type: PageTransitionType.rightToLeftWithFade));
      },
      title: 'Used',
      subtitle: 'Cars',
      image: 'assets/images/usedcars.png',
    ),
    ContainerModel(
      ontap: (BuildContext context) {
        Navigator.push(
            context,
            PageTransition(
                child: const GaragePage(),
                type: PageTransitionType.rightToLeftWithFade));
      },
      title: 'Garages',
      subtitle: '',
      image: 'assets/images/garages.png',
    ),
    ContainerModel(
      ontap: (BuildContext context) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ProfessionalMachanics()));
      },
      title: 'Professional',
      subtitle: 'Machanics',
      image: 'assets/images/machines.png',
    ),
    ContainerModel(
      ontap: (BuildContext context) {
        Navigator.push(
            context,
            PageTransition(
                child: const UsedCars(),
                type: PageTransitionType.rightToLeftWithFade));
      },
      title: 'Used',
      subtitle: 'Cars',
      image: 'assets/images/usedcars.png',
    ),
    ContainerModel(
      ontap: (BuildContext context) {
        Navigator.push(
            context,
            PageTransition(
                child: const SpareParts(),
                type: PageTransitionType.rightToLeftWithFade));
      },
      title: 'Garages',
      subtitle: '',
      image: 'assets/images/machines.png',
    ),
  ];

  void search(String searchString) {
    setState(() {
      searchList = containerModel
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
        title: const Text(
          'Welcome Back',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle,
                color: Colors.black,
              )),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
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
                  itemBuilder: ((context, index) => ItemContainer(
                        containerModel: searchList[index],
                        onTap: () => searchList[index].ontap!(context),
                      )),
                  itemCount: searchList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
