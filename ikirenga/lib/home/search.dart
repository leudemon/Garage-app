import 'package:flutter/material.dart';
import 'package:ikirengaauto/model/container_model.dart';




class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  List<ContainerModel> searchList = [];
  List<ContainerModel> containerModel = [];

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (value) => search(value),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: clearSearch,
          ),
        ],
      ),
    );
  }
}
