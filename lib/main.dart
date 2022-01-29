import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyam_2_final/Onbording_pages/onboarding1.dart';
import 'package:vyam_2_final/Themes/themes.dart';

import 'Home/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      home: Onboarding1(),
      getPages: [
        GetPage(name: "/", page: ()=>const HomePage(title: 'Flutter Demo Home Page',)),

      ],
    );
  }
}

