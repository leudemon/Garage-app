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
      decoration: const InputDecoration(
          border: InputBorder.none,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          prefixIcon: Icon(Icons.lock, color: Colors.black),
          hintStyle: TextStyle(color: Colors.black54),
          hintText: '●●●●●●●●●●',
          suffixIcon: Icon(Icons.visibility_off, color: Colors.black)),
    );
  }
}
