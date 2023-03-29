import 'package:flutter/material.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:ikirengaauto/productpages/spareparts.dart';
import 'package:ikirengaauto/productpages/usedcar.dart';
import 'package:ikirengaauto/widget/item_container.dart';
import 'package:page_transition/page_transition.dart';

import '../productpages/mechanics.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<ContainerModel> searchList = [];
  List<ContainerModel> containerModel = [

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
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Recent Searches',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.history,
                  color: Colors.black,
                  size: 35,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
    );
  }
}