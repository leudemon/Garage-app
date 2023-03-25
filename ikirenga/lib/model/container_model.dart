import 'package:flutter/cupertino.dart';

class ContainerModel {
  final Function(BuildContext context)? ontap;
  final String title;
  String? subtitle;
  final String image;
  ContainerModel({
    required this.ontap,
    required this.title,
    this.subtitle = '',
    required this.image,
  });
}

class UsedCarsModel {
  final Function(BuildContext context)? ontap;
  final String title;
  final String image;
  final String price;
  UsedCarsModel({
    required this.ontap,
    required this.title,
    required this.image,
    required this.price,
  });
}

class SparePartsModel {
  final Function(BuildContext context)? ontap;
  final String title;
  final String image;
  final String price;
  SparePartsModel({
    required this.ontap,
    required this.title,
    required this.image,
    required this.price,
  });
}
