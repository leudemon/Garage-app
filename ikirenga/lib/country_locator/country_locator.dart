import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class CountryLocator extends StatefulWidget {
  const CountryLocator({super.key});

  @override
  State<CountryLocator> createState() => _CountryLocatorState();
}

class _CountryLocatorState extends State<CountryLocator> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        maxLines: 1,
        decoration: InputDecoration(
          labelText: 'Enter Phone Number',
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: CountryCodePicker(
              initialSelection: 'RW',
              favorite: const ['+250', 'RW'],
              showCountryOnly: false,
              showFlag: true,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
              boxDecoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(5)),
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
