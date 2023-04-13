import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/model/container_model.dart';

class SingleServicedetail extends StatelessWidget {
  final MechanicsModel mechanicsModel;
  const SingleServicedetail({super.key, required this.mechanicsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Image.network(
                mechanicsModel.image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    mechanicsModel.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 100.h),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(MediaQuery.of(context).size.width , 10),
                        elevation: 0,
                        backgroundColor: const Color(0xFFFFDB47),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 120, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: (){},
                      child: const Text('Book',
                          style: TextStyle(fontSize: 16, color: Colors.black)))
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  Widget container(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(subtitle,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
