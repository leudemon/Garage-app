import 'package:flutter/material.dart';
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
  List<SparePartsModel> searchList = [];
  List<SparePartsModel> sparePartsModel = [
    SparePartsModel(
      title: 'Engine Pistons',
      image: 'assets/images/imput_image_one.png',
      price: 21000000,
      description:
          'The idling device of the compressor 1.18493 controls the flow rate if less air is required. A feed pump can be flanged directly to the compressor. The crankshaft is forged. All highly stressed surfaces are induction hardened to minimize wear. The connecting rods are made of die-cast aluminum. Valve reeds are made of a special flexible stainless steel. All of these measures significantly increase the service life of the compressor',
    ),
    SparePartsModel(
      title: 'Brake Caliper',
      image: 'assets/images/imput_image2.png',
      price: 100000,
      description:
          'The idling device of the compressor 1.18493 controls the flow rate if less air is required. A feed pump can be flanged directly to the compressor. The crankshaft is forged. All highly stressed surfaces are induction hardened to minimize wear. The connecting rods are made of die-cast aluminum. Valve reeds are made of a special flexible stainless steel. All of these measures significantly increase the service life of the compressor',
    ),
    SparePartsModel(
      title: 'Window Motor',
      image: 'assets/images/imput_image3.png',
      price: 34000000,
      description:
          'The idling device of the compressor 1.18493 controls the flow rate if less air is required. A feed pump can be flanged directly to the compressor. The crankshaft is forged. All highly stressed surfaces are induction hardened to minimize wear. The connecting rods are made of die-cast aluminum. Valve reeds are made of a special flexible stainless steel. All of these measures significantly increase the service life of the compressor',
    ),
    SparePartsModel(
      title: 'Wheel bearing',
      image: 'assets/images/imput_image4.png',
      price: 38000000,
      description:
          'The idling device of the compressor 1.18493 controls the flow rate if less air is required. A feed pump can be flanged directly to the compressor. The crankshaft is forged. All highly stressed surfaces are induction hardened to minimize wear. The connecting rods are made of die-cast aluminum. Valve reeds are made of a special flexible stainless steel. All of these measures significantly increase the service life of the compressor',
    ),
    SparePartsModel(
      title: 'Engine Pistons',
      image: 'assets/images/imput_image_one.png',
      price: 32000000,
      description:
          'The idling device of the compressor 1.18493 controls the flow rate if less air is required. A feed pump can be flanged directly to the compressor. The crankshaft is forged. All highly stressed surfaces are induction hardened to minimize wear. The connecting rods are made of die-cast aluminum. Valve reeds are made of a special flexible stainless steel. All of these measures significantly increase the service life of the compressor',
    ),
    SparePartsModel(
      title: 'Window Motor',
      image: 'assets/images/imput_image3.png',
      price: 80000000,
      description:
          'The idling device of the compressor 1.18493 controls the flow rate if less air is required. A feed pump can be flanged directly to the compressor. The crankshaft is forged. All highly stressed surfaces are induction hardened to minimize wear. The connecting rods are made of die-cast aluminum. Valve reeds are made of a special flexible stainless steel. All of these measures significantly increase the service life of the compressor',
    ),
  ];
  void search(String searchString) {
    setState(() {
      searchList = sparePartsModel
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
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0),
                itemBuilder: ((context, index) => SpartPartCars(
                      sparePartsModel: searchList[index],
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: SparePartSingleDetail(
                                  sparePartsModel: searchList[index],
                                ),
                                type: PageTransitionType.rightToLeft));
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
}
