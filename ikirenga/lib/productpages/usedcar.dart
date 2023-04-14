import 'package:flutter/material.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:ikirengaauto/productpages/widget/car_details/single_car_detail.dart';
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
  List<UsedCarsModel> usedCarModel = [];

  void search(String searchString) {
    setState(() {
      usedCars = usedCarModel
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
      body: SafeArea(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              onChanged: (value) => search(value),
              decoration:  InputDecoration(
                prefixIcon: const Icon(Icons.search_outlined,),
                border: InputBorder.none,
                hintText: 'Search',
                suffixIcon: IconButton(
                  onPressed:(){},
                  icon: const Icon(Icons.close, color: Colors.black,),
                  splashRadius: 1,
                ),
              ),
            ),
          ),
          const Divider(),
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
                  return Cars(
                      usedCarsModel: usedCars[index],
                      onTap: (){
                      Navigator.push(
                        context,
                        PageTransition(
                            child: SingleCarDetail(usedCarsModel: usedCars[index]), type: PageTransitionType.fade));
                      });
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
      const ipaddress = '192.168.137.1';
      const url = 'http://$ipaddress:1337/api/used-cars?populate=image';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      final data = json["data"] as List<dynamic>;

      final converts = data.map((e) {
        final titleVal=e['attributes']['make'];
        final imageVal="http://$ipaddress:1337${e['attributes']['image']['data'][0]['attributes']
        ['formats']['thumbnail']['url']}";
        final int priceVal = e['attributes']['price'];
        final int yearVal = e['attributes']['year'];
        return UsedCarsModel(
          title: titleVal,
          image: imageVal,
          price: priceVal,
          condition: e['attributes']['condition'],
          make:e['attributes']['make'],
          fuelType: e['attributes']['fuel_type'],
          model: e['attributes']['model'],
          transmission: e['attributes']['transmission'],
          year: yearVal,
        );
      }).toList();
      setState(() {
        usedCars = converts;
      });

    } catch (e) {
      print('error: $e');
    }
  }

}

