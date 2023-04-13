// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ikirengaauto/productpages/widget/machines_container.dart';
// import 'package:page_transition/page_transition.dart';
//
// import 'widget/single_service_detail.dart';
//
// class ProfessionalMachanics extends StatefulWidget {
//   const ProfessionalMachanics({super.key});
//
//   @override
//   State<ProfessionalMachanics> createState() => _ProfessionalMachanicsState();
// }
//
// class _ProfessionalMachanicsState extends State<ProfessionalMachanics> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//         ),
//         title: const Text(
//           'MECHANICS',
//           style: TextStyle(
//               fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.filter_list_outlined,
//                 color: Colors.black,
//               )),
//         ],
//       ),
//       body: SafeArea(
//           child: Expanded(
//         child: ListView(
//           children: [
//             MachanicsContainer(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                       child: const SingleServicedetail(),
//                       type: PageTransitionType.rightToLeftWithFade),
//                 );
//               },
//             ),
//             SizedBox(height: 10.h),
//             MachanicsContainer(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                       child: const SingleServicedetail(),
//                       type: PageTransitionType.rightToLeftWithFade),
//                 );
//               },
//             ),
//             SizedBox(height: 10.h),
//             MachanicsContainer(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                       child: const SingleServicedetail(),
//                       type: PageTransitionType.rightToLeftWithFade),
//                 );
//               },
//             ),
//             SizedBox(height: 10.h),
//             MachanicsContainer(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                       child: const SingleServicedetail(),
//                       type: PageTransitionType.rightToLeftWithFade),
//                 );
//               },
//             ),
//             SizedBox(height: 10.h),
//             MachanicsContainer(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                       child: const SingleServicedetail(),
//                       type: PageTransitionType.rightToLeftWithFade),
//                 );
//               },
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
