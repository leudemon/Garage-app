import 'package:flutter/material.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.grey[200],
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'CHECKOUT',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.all(5),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5),
                //     color: Colors.black54,
                //   ),
                //   alignment: Alignment.centerRight,
                //   child: Center(
                //     child: Text('Change',
                //         style: TextStyle(
                //             fontSize: 13.sp,
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold)),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
