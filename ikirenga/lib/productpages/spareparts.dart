import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:ikirengaauto/Api/fetch.dart';
import 'package:ikirengaauto/productpages/widget/spare_parts.dart';
import 'package:ikirengaauto/productpages/widget/spareparts_details/spareparts_single_detals.dart';
import 'package:page_transition/page_transition.dart';

import '../model/container_model.dart';

class SpareParts extends StatefulWidget {
  const SpareParts({super.key});

  @override
  State<SpareParts> createState() => _SparePartsState();
}

class _SparePartsState extends State<SpareParts> {
  @override
  void initState() {
    search('');
    super.initState();
    fetchData();
  }
  List<SparePartsModel> spareParts= [];
  List<SparePartsModel> searchList = [];
  List<SparePartsModel> sparePartsModel = [];
  void search(String searchString) {
    setState(() {
      searchList = spareParts
          .where(
              (element) => element.title.toLowerCase().contains(searchString))
          .toList();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0),
                itemBuilder: (context, index) {
                  print(spareParts[index]);
                  return SpartPartCars(
                      sparePartsModel: spareParts[index],
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: SparePartSingleDetail(
                                  sparePartsModel: spareParts[index],
                                ),
                                type: PageTransitionType.rightToLeft));
                      });
                },
                itemCount: spareParts.length,
              ),
            ),
          ),
        ]),
      ),
    );
  }
  void fetchData() async {
    try {
      print('Fetching data...');
      const ipaddress = "192.168.6.244";
      const url = 'http://$ipaddress:1337/api/spare-parts?populate=image';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      final data = json["data"] as List<dynamic>;

      final converts = data.map((e) {
        final titleVal=e['attributes']['name'];

        final imageVal="http://$ipaddress:1337${e['attributes']['image']['data'][0]['attributes']
        ['formats']['thumbnail']['url']}";
        final int priceVal = e['attributes']['price'];
        return SparePartsModel(
          title: titleVal,
          image: imageVal,
          price: priceVal,
          description: e['attributes']['description'],

        );
      }).toList();
      print(converts.length);
      setState(() {
        spareParts = converts;
      });
      print('fetch complete!');
    } catch (e) {
      print('error: $e');
    }
  }
}
