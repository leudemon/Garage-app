import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:ikirengaauto/productpages/widget/machines_container.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'widget/single_service_detail.dart';


class Mechanics extends StatefulWidget {
  const Mechanics({super.key});

  @override
  State<Mechanics> createState() => _MechanicsState();

}


class _MechanicsState extends State<Mechanics> {@override
  void initState() {
    super.initState();
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
                      type: PageTransitionType.rightToLeftWithFade),
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
      print('Fetching data...');
      const ipaddress = "192.168.137.1";
      const url = 'http://$ipaddress:1337/api/mechanics?populate=image';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      final data = json["data"] as List<dynamic>;

      final converts = data.map((e) {
        final name=e['attributes']['name'];
        final location=e['attributes']['location'];
        final image="http://$ipaddress:1337${e['attributes']['image']['data']
        ['attributes']['formats']['small']['url']}";
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
      print(converts.length);
      setState(() {
        mechanics = converts;
      });
      print('fetch complete!');
    } catch (e) {
      print('error: $e');
    }
  }
}
