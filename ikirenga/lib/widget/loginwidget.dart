// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  IconData? icon;
  LoginWidget({
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
          ),
          prefixIcon: Image.asset(
            'assets/icons/person.png',
            scale: 2,
          ),
          hintText: 'Username',
          hintStyle: const TextStyle(color: Colors.black54),
          suffixIcon: Icon(icon, color: Colors.green)),
    );
  }
}
