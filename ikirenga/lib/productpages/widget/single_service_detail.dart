import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleServicedetail extends StatefulWidget {
  final MechanicsModel mechanicsModel;
  const SingleServicedetail({super.key, required this.mechanicsModel});

  @override
  State<SingleServicedetail> createState() => _SingleServicedetailState();
}

class _SingleServicedetailState extends State<SingleServicedetail> {

  @override
  Widget build(BuildContext context) {
    final double rating;
    switch(widget.mechanicsModel.rating) {
      case 'one': {
        rating = 1;
      }
      break;
      case 'two': {
        rating = 2;
      }
      break;
      case 'three': {
        rating = 3;
      }
      break;
      case 'four': {
        rating = 4;
      }
      break;
      case 'five': {
        rating = 5;
      }
      break;

      default: {
        rating = 1;
      }
      break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mechanicsModel.name),
        centerTitle: true,
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.network(
                widget.mechanicsModel.image,
                height: 300.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Column(
                    children: [
                      const Text(
                        'Professional Mechanic',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const Spacer(),
                      RatingBarIndicator(
                      rating: rating,
                      itemSize: 40,
                      itemBuilder: (context, _)=>Icon(Icons.star, color: Colors.amber,)
                      ),
                      const Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(MediaQuery.of(context).size.width , 10),
                            elevation: 0,
                            backgroundColor: const Color(0xFFFFDB47),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {
                            openWhatsApp('250785737078',
                                '*BOOKING INQUIRY*'
                                    '\nMechanic:${widget.mechanicsModel.name} '
                                    '\nlocation:${widget.mechanicsModel.location}'
                                    '\n'
                                    '\nwhat seems to be the issue?'
                                    '\n>> ');
                          },
                          child: const Text('Book',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black))),
                      SizedBox(height: 10.h),

                    ],
                  )),
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

void openWhatsApp(String number, String message) async {
  String formattedMessage =
      message.replaceAll('\n', '%0A').replaceAll('\t', '%09');
  String url = "https://wa.me/$number?text=$formattedMessage";
  await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  ;
}
