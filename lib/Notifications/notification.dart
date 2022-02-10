import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vyam_2_final/api/api.dart';
import 'package:vyam_2_final/controllers/gym_detail.dart';
// import 'package:vyambooking/List/list.dart';

class NotificationDetails extends StatefulWidget {
  NotificationDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationDetails> createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  List events = [];
  List notificationList = [];

  NotificationApi notificationApi = NotificationApi();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: HexColor("3A3A3A"),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: GoogleFonts.poppins(
              color: HexColor("3A3A3A"),
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
          future: notificationApi.getCouponNotificationData(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.done) {
              notificationList = snapshot.data as List;
              print(notificationList.length);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: _height * 0.7,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: notificationList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    elevation: 8,
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      width: _width * 0.9,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 22.0,
                                                left: 18,
                                                bottom: 22),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (notificationList[index]
                                                        ['type']
                                                    .toString()
                                                    .contains("coupon"))
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                          "assets/icons/discount.png"),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        notificationList[index]
                                                            ['detail'],
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: HexColor(
                                                                    "3A3A3A"),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ],
                                                  ),
                                                if (notificationList[index]
                                                        ['type']
                                                    .toString()
                                                    .contains("remainder"))
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.warning_amber,
                                                        color: Colors.red,
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        notificationList[index]
                                                            ['detail'],
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: HexColor(
                                                                    "3A3A3A"),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Container(
                        width: _width * 0.9,
                        height: 50,
                        decoration: BoxDecoration(
                            color: HexColor("292F3D"),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            "Clear all",
                            style: GoogleFonts.poppins(
                                color: HexColor("FFFFFF"),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: Image.asset(
                "assets/Illustrations/notification empty.png",
              ),
            );
          }),
    );
  }
}
