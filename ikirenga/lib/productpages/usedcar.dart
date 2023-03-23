import 'package:flutter/material.dart';

class UsedCars extends StatefulWidget {
  const UsedCars({super.key});

  @override
  State<UsedCars> createState() => _UsedCarsState();
}

class _UsedCarsState extends State<UsedCars> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Used Cars',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}
