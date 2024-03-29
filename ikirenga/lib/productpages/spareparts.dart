import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:ikirengaauto/Api/fetchCars.dart';
import 'package:ikirengaauto/productpages/widget/spare_parts.dart';
import 'package:ikirengaauto/productpages/widget/spareparts_details/spareparts_single_detals.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ikirengaauto/Variables/constants.dart';

import '../model/container_model.dart';

class SpareParts extends StatefulWidget {
  const SpareParts({super.key});

  @override
  State<SpareParts> createState() => _SparePartsState();
}

class _SparePartsState extends State<SpareParts> {
  final TextEditingController _searchController = TextEditingController();
  void initialize() async{
    await fetchData();
    search('');
  }
  @override
  void initState(){
    super.initState();
    initialize();

  }
  bool isSearching = false;
  bool isLoading = true;
  List<SparePartsModel> spareParts= [];
  List<SparePartsModel> searchList = [];
  List<SparePartsModel> sparePartsModel = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child:  TextField(
              controller: _searchController,
              onChanged: (value) {
                search(value.toLowerCase());
                setState(() {
                  isSearching = true;
                });
              },
              decoration:  InputDecoration(
                prefixIcon: const Icon(Icons.search_outlined,),
                border: InputBorder.none,
                hintText: 'Search',
                suffixIcon: IconButton(
                  onPressed:() {
                    _searchController.clear();
                    FocusScope.of(context).unfocus();
                    search('');
                  },
                  icon: const Icon(Icons.close, color: Colors.black,),
                  splashRadius: 1,
                ),
              ),
            ),
          ),
          const Divider(),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Visibility(
                    visible: isSearching != false,
                    child:Text("FOUND ${searchList.length ?? '0' } RESULTS", style: const TextStyle(fontSize: 14, color: Colors.grey),),)
              )

          ),          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Visibility(
                    visible: isSearching != true,
                    child: const Text("ALL SPARE PARTS", style: TextStyle(fontSize: 14, color: Colors.grey),),)
              )

          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0),
                itemBuilder: (context, index) {
                  return SpartPartCars(
                      sparePartsModel: searchList[index],
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: SparePartSingleDetail(
                                  sparePartsModel: searchList[index],
                                ),
                                type: PageTransitionType.rightToLeft));
                      });
                },
                itemCount: searchList.length,
              ),
            ),
          ),
        ]),
      ),
    );
  }
  Future<void> fetchData() async {
    try {

      const ipaddress = ip;
      const url = '$ipaddress/api/spare-parts?populate=image';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      final data = json["data"] as List<dynamic>;

      final converts = data.map((e) {
        final titleVal=e['attributes']['name'];

        final imageVal="$ipaddress${e['attributes']['image']['data'][0]['attributes']
        ['formats']['thumbnail']['url']}";
        final int priceVal = e['attributes']['price'];
        return SparePartsModel(
          title: titleVal,
          image: imageVal,
          price: priceVal,
          description: e['attributes']['description'],

        );
      }).toList();
      if (mounted) {
        setState(() {
          spareParts = converts;
        });
      }
    } catch (e) {
      rethrow;
    }
  }


  void search(String searchString) {
    setState(() {
      isLoading = false;
      if(searchString.isEmpty) {
        searchList = spareParts;
      }else{
        searchList = spareParts
            .where(
                (element) => element.title.toString().toLowerCase().contains(searchString))
            .toList();
      }

    });
  }
}
