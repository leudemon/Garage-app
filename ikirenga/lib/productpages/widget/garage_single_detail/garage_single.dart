import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/model/container_model.dart';
import 'package:url_launcher/url_launcher.dart';


class GarageSingle extends StatefulWidget {
  final GaragesModel garagesModel;
  const GarageSingle({super.key, required this.garagesModel});

  @override
  State<GarageSingle> createState() => _GarageSingleState();
}

class _GarageSingleState extends State<GarageSingle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_backspace_outlined,
                color: Colors.black,
                size: 30.sp,
              )),
          backgroundColor: Colors.white,
          elevation: 0.0,
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
                  widget.garagesModel.image,
                  height: 300.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30.h),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        widget.garagesModel.service,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        widget.garagesModel.description,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      const Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                            Size(MediaQuery.of(context).size.width , 20),
                            elevation: 0,
                            backgroundColor: const Color(0xFFFFDB47),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {
                            openWhatsApp('250782554019',
                                '*BOOKING INQUIRY*'
                                    '\nService:${widget.garagesModel.service} '
                                    '\n1.Delivering car to garage'
                                    '\n2.Car should be picked up'
                                    '\nchoice: '
                                    '\n>> ');
                          },
                          child: const Text('BOOK',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

void openWhatsApp(String number, String message) async {
  String formattedMessage =
  message.replaceAll('\n', '%0A').replaceAll('\t', '%09');
  String url = "https://wa.me/$number?text=$formattedMessage";
  await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  ;
}