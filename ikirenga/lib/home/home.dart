import 'package:flutter/material.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:ikirengaauto/productpages/spareparts.dart';
import 'package:ikirengaauto/productpages/usedcar.dart';
import 'package:ikirengaauto/widget/item_container.dart';
import 'package:page_transition/page_transition.dart';

import '../productpages/garage.dart';
import '../productpages/mechanics.dart';

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
                alignment: Alignment.center,
                type: PageTransitionType.fade));
      },
      title: 'Spare Parts',
      subtitle: '',
      image: 'assets/images/spareparts.png',
    ),
    ContainerModel(
      ontap: (BuildContext context) {
        Navigator.push(
            context,
            PageTransition(
                child: const UsedCars(),
                alignment: Alignment.center,
                type: PageTransitionType.fade));
      },
      title: 'Used Cars',
      subtitle: '',
      image: 'assets/images/usedcars.png',
    ),
    ContainerModel(
      ontap: (BuildContext context) {
        Navigator.push(
            context,
            PageTransition(
                child: const GaragePage(),
                alignment: Alignment.center,
                type: PageTransitionType.fade));
      },
      title: 'Garages',
      subtitle: '',
      image: 'assets/images/garages.png',
    ),
    ContainerModel(
      ontap: (BuildContext context) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Mechanics()));
      },
      title: 'Mechanics',
      subtitle: '',
      image: 'assets/images/machines.png',
    ),
    ContainerModel(
      ontap: (BuildContext context) {
        Navigator.push(
            context,
            PageTransition(
                child: const UsedCars(),
                alignment: Alignment.center,
                type: PageTransitionType.fade));
      },
      title: 'Used Cars',
      subtitle: '',
      image: 'assets/images/usedcars.png',
    ),
    ContainerModel(
      ontap: (BuildContext context) {
        Navigator.push(
            context,
            PageTransition(
                child: const SpareParts(),
                alignment: Alignment.bottomCenter,
                type: PageTransitionType.fade));
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
        automaticallyImplyLeading: false,
        toolbarHeight: 30,
        titleSpacing: 0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leadingWidth: 25,
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(40.0), // Set the height as needed
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(
                vertical: 15.0, horizontal: 30), // Adjust the padding as needed
            child: const Text('Welcome Back, Severin!',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                alignment: AlignmentDirectional.centerEnd,
                margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.start,
                    onChanged: (value) => search(value),
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      suffixIconColor: Colors.black26,
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.cancel_outlined),
                      hintText: 'Search',
                    ),
                  ),
                )),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7,
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0),
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
