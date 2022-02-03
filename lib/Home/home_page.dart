import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.location_fill,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "2972 Westheimer Rd, Illinois 85486 ",
          style: TextStyle(
              color: Colors.black,
              fontSize: size.height * .02
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell_fill,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              Get.isDarkMode ? "Dark" : "Light",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Get.changeThemeMode(
            Get.isDarkMode ? ThemeMode.light : ThemeMode.dark
        );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

