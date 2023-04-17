import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/viewmodel/sparepart_cartmodel.dart';
import 'widget/cart_list.dart';
import 'widget/paymet_container.dart';

class OrderReview extends StatefulWidget {
  final List<CartItem> purchasedItem;
  final String itemPrice;
  const OrderReview(
      {super.key, required this.purchasedItem, required this.itemPrice});

  @override
  State<OrderReview> createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReview> {
  List<CartItem> selectedItems = [];
  List<String> itemNames = [];


  @override
  void initState() {
    super.initState();
    selectedItems = widget.purchasedItem;
    setStuff();

  }
  void setStuff(){
    for (var item in selectedItems) {
      if(!itemNames.contains(item.itemName)){
        itemNames.add(item.itemName);
      }else{
        itemNames.remove(item.itemName);
      }
    }


  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_backspace_outlined,
              color: Colors.black,
              size: 30,
            )),
        title: Text(
          'ORDER',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text('ORDER VIA',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Icons.phone, color: Colors.green),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('WhatsApp',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    const Spacer(),
                    // Container(
                    //   padding: const EdgeInsets.all(5),
                    //   alignment: Alignment.centerRight,
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xFFFFDB47),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Center(
                    //     child: Text('Change',
                    //         style: TextStyle(
                    //             fontSize: 18.sp,
                    //             color: Colors.black,
                    //             fontWeight: FontWeight.bold)),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const CartList(),
              SizedBox(
                height: 20.h,
              ),
              Text('PAYMENT',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: 10.h,
              ),
              const PaymentContainer(),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400)),
                  Text('free',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    // Display the item names and prices
                    SizedBox(
                      height:230.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: widget.purchasedItem.length,
                        itemBuilder: (context, index) {
                          final item = widget.purchasedItem[index];
                          return ListTile(
                            title: Text(item.itemName),
                            trailing: Text('${item.item.price}'),
                          );
                        },
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400)),
                  Consumer<CartModel>(
                    builder: (context, value, child) => Text(
                        value.calculateTotal(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xFFFFDB47),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        String latestListAsString = itemNames.join("\n");
                        openWhatsApp(
                          '250785737078',
                          '*NEW ORDER*'
                              '\nTotal:${widget.itemPrice} rwf'
                              '\nPurchased Item(s):'
                              '\n$latestListAsString'
                              '\n___________________'
                              '\n⚠WARNING⚠ '
                              '\ndo not change anything above this section'
                              '\n___________________'
                              '\nThanks!',
                        );
                      },

                      child: Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                'PLACE ORDER',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: const Image(
                                image:
                                    AssetImage('assets/icons/arrow-right.png'),
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openWhatsApp(String number, String message) async {
    String formattedMessage =
        message.replaceAll('\n', '%0A').replaceAll('\t', '%09');
    String url = "https://wa.me/$number?text=$formattedMessage";
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    ;
  }
}
