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
            borderSide: BorderSide(color: Colors.black),
          ),
          prefixIcon:
              const Icon(Icons.perm_identity_rounded, color: Colors.black),
          hintText: 'Username',
          hintStyle: const TextStyle(color: Colors.black54),
          suffixIcon: Icon(icon, color: Colors.green)),
    );
  }
}
