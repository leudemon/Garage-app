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

class UsedCarData{
  // final String make;
  // final String model;
  final String price;
  UsedCarData({
    // // required this.make,
    // required this.model,
    required this.price,

});
}

class UsedCarsModel {
  List <String> image;
  final int price;
  final String condition;
  final String make;
  final String model;
  final String title;
  final String transmission;
  final String fuelType;
  final int year;

  UsedCarsModel({
    required this.image,
    required this.price,
    required this.condition,
    required this.make,
    required this.model,
    required this.transmission,
    required this.fuelType,
    required this.year,
  }) : title = '$make $model';
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

class MechanicsModel {
  final String name;
  final String location;
  final String phone;
  final String rating;
  final String image;
  MechanicsModel({
    required this.name,
    required this.location,
    required this.phone,
    required this.rating,
    required this.image,
  });
}class GaragesModel {
  final String service;
  final String description;
  final String image;
  final String logo;
  GaragesModel({
    required this.service,
    required this.description,
    required this.image,
    required this.logo,
  });
}

class PurchasedItemModel {
  final String total;
  PurchasedItemModel({required this.total});
}
