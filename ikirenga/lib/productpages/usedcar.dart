import 'package:flutter/material.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:ikirengaauto/productpages/widget/car_details/single_car_detail.dart';
import 'package:ikirengaauto/productpages/widget/home_container.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'widget/cars.dart';

class UsedCars extends StatefulWidget {
  const UsedCars({super.key});

  @override
  State<UsedCars> createState() => _UsedCarsState();
}

class _UsedCarsState extends State<UsedCars> {
  List<UsedCarsModel> usedCars = [];


  List<UsedCarsModel> searchList = [];
  List<UsedCarsModel> usedCarModel = [
    // UsedCarsModel(
    //     title: 'Car Name',
    //     image: 'assets/images/carimagefour.png',
    //     price: 100000),
    // UsedCarsModel(
    //     title: 'Car Name',
    //     image: 'assets/images/carimagefour.png',
    //     price: 80000),
    // UsedCarsModel(
    //     title: 'Car Name',
    //     image: 'assets/images/carimagefour.png',
    //     price: 38000),
    // UsedCarsModel(
    //     title: 'Car Name',
    //     image: 'assets/images/carimagefour.png',
    //     price: 140000),
    // UsedCarsModel(
    //     title: 'Car Name',
    //     image: 'assets/images/carimagefour.png',
    //     price: 80000),
  ];

  void search(String searchString) {
    setState(() {
      searchList = usedCarModel
          .where(
              (element) => element.title.toString().toLowerCase().contains(searchString))
          .toList();
    });
  }

  @override
  void initState() {
    search('');
    super.initState();
    fetchData();
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
            child: usedCars.isEmpty // Check if the usedCars list is empty
                ? const Center(child: CircularProgressIndicator()) // Show a CircularProgressIndicator while the data is being fetched
                : Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0
                ),
                itemBuilder: (context, index) {
                  final car = usedCars[index];
                  return Cars(onTap: (){
                    Navigator.push(
                        context,
                        PageTransition(
                            child: SingleCarDetail(usedCarsModel: usedCars[index]), type: PageTransitionType.fade));
                  }, usedCarsModel: usedCars[index]);
                },
                itemCount: usedCars.length,
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
      const ipaddress = '192.168.148.244';
      const url = 'http://${ipaddress}:1337/api/used-cars?populate=image';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      final picture = json['data'];
      final data = json["data"] as List<dynamic>;

      final converts = data.map((e) {
        final titleVal=e['attributes']['make'];
        final imageVal="http://$ipaddress:1337${e['attributes']['image']['data'][0]['attributes']
        ['formats']['thumbnail']['url']}";
        final int priceVal = e['attributes']['price'];
        return UsedCarsModel(
          title: titleVal,
          image: imageVal,
          price: priceVal,
        );
      }).toList();
      print(converts.length);
      setState(() {
        usedCars = converts;
      });

      print('fetch complete!');
    } catch (e) {
      print('error: $e');
    }
  }

}

