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
  final String title;
  final String image;
  final int price;
  UsedCarsModel({
    required this.title,
    required this.image,
    required this.price,
  });
}

class SparePartsModel {
  final String title;
  final String image;
  final int price;
  final String description;
  SparePartsModel({
    required this.title,
    required this.image,
    required this.price,
    required this.description,
  });
}
