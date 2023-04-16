import 'package:flutter/material.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:ikirengaauto/productpages/widget/machines_container.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'widget/single_service_detail.dart';
import 'package:ikirengaauto/Variables/constants.dart';


class Mechanics extends StatefulWidget {
  const Mechanics({super.key});

  @override
  State<Mechanics> createState() => _MechanicsState();

}


class _MechanicsState extends State<Mechanics> {@override

@override
void initState(){
  initialize();
  super.initState();

}
void initialize() {
  fetchData();
}

  List<dynamic> mechanics = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 25),
      child: SafeArea(
        child: mechanics.isEmpty // Check if the usedCars list is empty
            ? const Center(child: CircularProgressIndicator()) // Show a CircularProgressIndicator while the data is being fetched
            :ListView.builder(
          itemCount: mechanics.length,
          itemBuilder: (context, index){
            return MachanicsContainer(
              mechanicsModel: mechanics[index],
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: SingleServicedetail( mechanicsModel: mechanics[index],),
                      type: PageTransitionType.fade),

                );
              },
            );
          },

        ),
      ),
    ));
  }
  void fetchData() async {
    try {
      const ipaddress = ip;
      const url = '$ipaddress/api/mechanics?populate=image';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      final data = json["data"] as List<dynamic>;
      final converts = data.map((e) {
        final name=e['attributes']['name'];
        final location=e['attributes']['location'];
        final image="$ipaddress${e['attributes']['image']['data']['attributes']['formats']['thumbnail']['url']}";
        final phone = e['attributes']['phoneNumber'];
        final rating = e['attributes']['rating'];
        return MechanicsModel(
          name: name,
          location: location,
          phone: phone,
          image: image,
          rating: rating

        );
      }).toList();
      setState(() {
        mechanics = converts;
      });
    } catch (e) {
    rethrow;
    }
  }
}
