import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/Ikirenga_icons.dart';
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
      title: 'SPARE PARTS',
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
      title: 'USED CARS',
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
      title: 'GARAGES',
      subtitle: '',
      image: 'assets/images/garages.png',
    ),
    ContainerModel(
      ontap: (BuildContext context) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Mechanics()));
      },
      title: 'MECHANICS',
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
      title: 'USEDCARS',
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
      title: 'GARAGES',
      subtitle: '',
      image: 'assets/images/machines.png',
    ),
  ];
  final TextEditingController _searchController = TextEditingController();

  void search(String searchString) {
    setState(() {
      searchList = containerModel
          .where(
              (element) => element.title.toLowerCase().contains(searchString))
          .toList();
    });
  }
  void clearSearch() {
    _searchController.clear();
    search('');
    FocusScope.of(context).unfocus();
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
        toolbarHeight: 75.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 10,
        leadingWidth: 55,
        leading: const Padding(
          padding: EdgeInsets.only(left:20.0),
          child: CircleAvatar(
            radius: 10,
            child: Icon(
              Ikirenga.person,
              color: Colors.yellow,
              size: 30,
            ),
          )
        ),
        title: const Text(
          'Welcome Back, Severin!',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.settings_rounded)
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                alignment: AlignmentDirectional.centerEnd,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: TextField(

                    textAlign: TextAlign.start,
                    onChanged: (value) => search(value),
                    decoration:  InputDecoration(
                      prefixIcon: const Icon(Icons.search_rounded),
                      prefixIconColor: Colors.black,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                      suffixIconColor: Colors.black,
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      suffixIcon:  IconButton(
                        icon:  const Icon(Icons.clear_all_rounded),
                        onPressed: clearSearch,
                      ),
                      hintText: 'Search',
                    ),
                  ),
                )),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.fromLTRB(10,20,10,0 ),
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
