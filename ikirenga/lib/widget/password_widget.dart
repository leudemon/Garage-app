import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        obscuringCharacter: '●',
        style: const TextStyle(fontSize: 20, color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
          ),
          prefixIcon: Image.asset(
            'assets/icons/lock.png',
            scale: 2,
          ),
          hintStyle: const TextStyle(color: Colors.black54),
          hintText: '●●●●●●●●',
          suffixIcon: Image.asset(
            'assets/icons/eye.png',
            scale: 2,
          ),
        ));
  }
}
