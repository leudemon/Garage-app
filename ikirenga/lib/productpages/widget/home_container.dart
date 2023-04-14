import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/model/container_model.dart';


class HomeContainer extends StatefulWidget {
  final GaragesModel garagesModel;
  final onTap;
  const HomeContainer(
      {super.key,
      required this.garagesModel, required this.onTap});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(widget.garagesModel.service, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)
                ],
              ),
              Divider(),
              Row(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Flexible(child: Image.network(widget.garagesModel.image, height: 100,)),
                  SizedBox(width: 20.h,),
                  Flexible(
                    flex: 3,
                    child: Column(
                    children: [
                    Text(widget.garagesModel.description),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(widget.garagesModel.logo),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.yellow[600],
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),),
                              onPressed: widget.onTap,
                              child: Text('more')
                          )
                        ],
                      )
                    ],
                  ),),
                ],
              ),
              Row()
            ],
          ),
        ),
      ),
    );
  }
}

