// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vyam_2_final/Home/views/product_gyms.dart';
import 'package:vyam_2_final/controllers/home_controller.dart';

import '../../Notifications/notification.dart';
import 'gyms.dart';

class FirstHome extends StatefulWidget {
  const FirstHome({Key? key}) : super(key: key);

  @override
  State<FirstHome> createState() => _FirstHomeState();
}

class _FirstHomeState extends State<FirstHome> {
  var finaldaysLeft;
  var getPercentage;
  var progressColor;
  List daysLeft = [
    {"gymName": "Transformer Gym - Barakar", "dayleft": "15"},
  ];

  @override
  void initState() {
    int getDays = int.parse(daysLeft[0]["dayleft"]);
    getDays = 28 - getDays;
    finaldaysLeft = getDays / 28;
    getPercentage = finaldaysLeft * 100;

    if (getPercentage >= 90) {
      progressColor = Colors.red;
    }
    if (getPercentage <= 89 && getPercentage >= 75) {
      progressColor = const Color.fromARGB(255, 255, 89, 0);
    }
    if (getPercentage <= 74 && getPercentage >= 50) {
      progressColor = Colors.orange;
    }
    if (getPercentage <= 49 && getPercentage >= 0) {
      progressColor = Colors.yellow;
    }
    super.initState();
  }

  final backgroundColor = Colors.grey[200];

  final appBarColor = Colors.grey[300];

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.grey[100],
        // leading: IconButton(
        //   iconSize: 25,
        //   icon: const Icon(
        //     CupertinoIcons.location,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {
        //     Get.back();
        //   },
        // ),
        title: Transform(
          transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
          child: Row(
            children: [
              IconButton(
                iconSize: 25,
                icon: const Icon(
                  CupertinoIcons.location,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              SizedBox(
                width: size.width * .4,
                child: Text(
                  "2972 Westheimer Rd, Illinois 85486 ",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * .018,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell_fill,
              color: Colors.black,
            ),
            onPressed: () {
              Get.to(NotificationDetails());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CupertinoSearchTextField(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                onChanged: (String value) {
                  print('The text has changed to: $value');
                },
                onSubmitted: (String value) {
                  print('Submitted text: $value');
                },
              ),
              const SizedBox(
                height: 15,
              ),
              if (getPercentage != 100) ProgressCard(context),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: size.height * .18,
                child: ListView.builder(
                  // controller: _controller.,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.boards.length,
                  itemBuilder: (context, int index) {
                    return SizedBox(
                      height: 120,
                      child: Row(
                        children: [
                          Image.asset(controller.boards[index].imageAssets),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: size.height * .2,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.OptionsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index) {
                    return SizedBox(
                      height: 150,
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GymOption()));
                              },
                              child: Image.asset(
                                  controller.OptionsList[index].imageAssets)),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                  height: 30,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nearby Gyms",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              ProductGyms(controller.GymLists, size.height * .6)
            ],
          ),
        ),
      ),
    );
  }

  Card ProgressCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(children: [
              if (finaldaysLeft != 1)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(daysLeft[0]["dayleft"],
                            style: GoogleFonts.poppins(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold)),
                        Text(" days to go",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(daysLeft[0]["gymName"],
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("Stay Strong !",
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              if (finaldaysLeft == 1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Subscription has been expired",
                        style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    InkWell(
                      onTap: () {
                        print("buy");
                      },
                      child: Text("Buy new packages",
                          style: GoogleFonts.poppins(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              const Spacer(),
              CircularPercentIndicator(
                animation: true,
                radius: 30.0,
                lineWidth: 10.0,
                percent: finaldaysLeft,
                progressColor: progressColor,
              ),
            ]),
          )),
    );
  }
}