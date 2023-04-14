import 'package:flutter/material.dart';
import 'package:ikirengaauto/Variables/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'widget/garage_single_detail/garage_single.dart';
import 'widget/home_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GaragePage extends StatefulWidget {
  const GaragePage({
    super.key,
  });
  @override
  State<GaragePage> createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  List<GaragesModel> services = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index){
                  return HomeContainer(
                    garagesModel: services[index],
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: GarageSingle(garagesModel: services[index],),
                              type: PageTransitionType.rightToLeft));
                    },

                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
  void fetchData() async {
    try {
      print('Fetching data...');
      const ipaddress = ip;
      const url = 'http://$ipaddress:1337/api/garages?populate=image&populate=logo';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      final data = json["data"] as List<dynamic>;

      final converts = data.map((e) {
        final service=e['attributes']['service'];
        final image="http://$ipaddress:1337${e['attributes']['image']['data']['attributes']
        ['url']}";
        final logo="http://$ipaddress:1337${e['attributes']['logo']['data']['attributes']
        ['url']}";
        final description = e['attributes']['description'];
        print(description);
        return GaragesModel(
          service: service,
          description: description,
          logo: logo,
          image: image,
        );
      }).toList();
      print(converts.length);
      setState(() {
        services = converts;
      });

      print('fetch complete!');
    } catch (e) {
      print('error: $e');
    }
  }
}
