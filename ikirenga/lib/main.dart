import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ikirengaauto/model/viewmodel/usedcars_cartmodel.dart';
import 'package:provider/provider.dart';
import 'model/viewmodel/sparepart_cartmodel.dart';
import 'onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SparePartCartModel()),
        ChangeNotifierProvider(create: (context) => UsedCarsCartModel()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          title: 'IKIRENGA AUTO',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.yellow,
          ),
          home: const OnBoardingScreen(),
        ),
      ),
    );
  }
}
