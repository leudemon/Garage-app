import 'package:flutter/material.dart';

class ProfessionalMachanics extends StatefulWidget {
  const ProfessionalMachanics({super.key});

  @override
  State<ProfessionalMachanics> createState() => _ProfessionalMachanicsState();
}

class _ProfessionalMachanicsState extends State<ProfessionalMachanics> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Professional Machanics',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}
