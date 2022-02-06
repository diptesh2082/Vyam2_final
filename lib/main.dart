import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyam_2_final/Onbording_pages/onboarding1.dart';
import 'package:vyam_2_final/Themes/themes.dart';
import 'package:vyam_2_final/authintication/login.dart';
import 'package:vyam_2_final/authintication/otp_screen.dart';
import 'package:vyam_2_final/authintication/regitration_from.dart';

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
      // theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      home: HomePage(),
      // initialRoute: ,
      getPages: [
        GetPage(name: HomePage.id, page: ()=>HomePage()),
        GetPage(name: "/login", page: ()=>const LoginPage()),
        GetPage(name: OtpPage.id, page: ()=>const OtpPage()),
        GetPage(name: RegistrationPage.id, page: ()=>const RegistrationPage()),

      ],
    );
  }
}

