import 'package:flutter/material.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:ikirengaauto/productpages/widget/car_details/single_car_detail.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'widget/cars.dart';
import 'package:ikirengaauto/Variables/constants.dart';


class UsedCars extends StatefulWidget {
  const UsedCars({Key? key});

  @override
  State<UsedCars> createState() => _UsedCarsState();
}

class _UsedCarsState extends State<UsedCars> {
  final TextEditingController _searchController = TextEditingController();
  List<UsedCarsModel> usedCars = [];
  List<UsedCarsModel> searchList = [];
  List<UsedCarsModel> usedCarModel = [];
  bool isLoading = true;
  bool isSearching = false;
  void search(String searchString) {
    setState(() {
      isLoading = false;
      if(searchString.isEmpty) {
        searchList = usedCars;
      }else{
        searchList = usedCars
            .where(
                (element) => element.title.toString().toLowerCase().contains(searchString))
            .toList();
      }

    });
  }

  void initialize() async{
    await fetchData();
    search('');
  }
  @override
  void initState(){
    initialize();
    super.initState();

  }



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
            child: TextField(
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
                    child: const Text("ALL CARS", style: TextStyle(fontSize: 14, color: Colors.grey),),)
              )

          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                :  Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0
                ),
                itemBuilder: ((context, index) => Cars(
                  usedCarsModel: searchList[index],
                  onTap: (){
                    Navigator.push(
                        context,
                        PageTransition(
                            child: SingleCarDetail(usedCarsModel: searchList[index], imageUrls:searchList[index].image ,), type: PageTransitionType.fade));
                  },
              )),

                itemCount: searchList.length,
              ),
            ),
          ),
        ]),
      ),
    );
  }


  Future<List<UsedCarsModel>> fetchData() async {
    try {
      const ipaddress = ip;
      const url = '$ipaddress/api/used-cars?populate=image';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      final data = json["data"] as List<dynamic>;

      final List<String> imageVal = []; // create an empty list of strings to hold the image URLs

      final List<UsedCarsModel> converts = data.map((e) {
        final List<dynamic> images = e['attributes']['image']['data'];
        final List<String> urls = []; // create a list of strings to hold the URLs for the current car

        for (final img in images) {
          final url = "$ipaddress${img['attributes']['formats']['small']['url']}";
          urls.add(url); // add the URL to the list of URLs
        }

        final int priceVal = e['attributes']['price'];
        final int yearVal = e['attributes']['year'];
        print(urls);
        return UsedCarsModel(
          image: urls, // set the image variable to the list of URLs
          price: priceVal,
          condition: e['attributes']['condition'],
          make: e['attributes']['make'],
          fuelType: e['attributes']['fuel_type'],
          model: e['attributes']['model'],
          transmission: e['attributes']['transmission'],
          year: yearVal,
        );
      }).toList();

      setState(() {
        usedCars = converts;
      });
      return converts;
    } catch (e) {
      rethrow;
    }
  }



}

