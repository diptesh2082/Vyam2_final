import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyam_2_final/Home/views/first_home.dart';
import 'package:vyam_2_final/Home/views/gyms.dart';
import 'package:vyam_2_final/Home/views/product_gyms.dart';
import 'package:vyam_2_final/Home/views/yoga.dart';
import 'package:vyam_2_final/Home/views/zumba.dart';
import 'package:vyam_2_final/controllers/home_controller.dart';


class HomePage extends StatefulWidget {
  static String id ="/HomePage";
  // const HomePage({Key? key, required this.title}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final backgroundColor = Colors.grey[200];
  final appBarColor = Colors.grey[300];
  final HomeController controller = Get.put(HomeController());
  final screens = [
    FirstHome(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black38,
        iconSize: 27,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.house,
                // color: Colors.black,
              ),
              label: 'Home',
              ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.library_books_outlined
                // color: Colors.black87,
              ),
              label: 'Bookings',
              ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.compass,
                // color: Colors.black87,
              ),
              label: 'Explore',
              ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box_outlined,
                // color: Colors.black87,
              ),
              label: 'Profile',
              ),
        ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

