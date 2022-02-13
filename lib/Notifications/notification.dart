import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vyam_2_final/controllers/gym_detail.dart';
// import 'package:vyambooking/List/list.dart';

class NotificationDetails extends StatelessWidget {
  NotificationDetails({
    Key? key,
  }) : super(key: key);

  List events = [];

  Future notificationListEvents() async {
    events = notificationList;
    await Future.delayed(const Duration(seconds: 1));
    if (events.isNotEmpty) {
      return events;
    }
    if (events.isEmpty) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
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
          future: notificationListEvents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
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
                                                    .type
                                                    .contains("Coupon"))
                                                  Row(
                                                    children: [
                                                      Text(
                                                        notificationList[index]
                                                            .notiTitle,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: HexColor(
                                                                    "3A3A3A"),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      const SizedBox(
                                                        width: 80,
                                                      ),
                                                      Image.asset(
                                                          "assets/icons/discount.png")
                                                    ],
                                                  ),
                                                if (notificationList[index]
                                                    .type
                                                    .contains("None"))
                                                  Text(
                                                    notificationList[index]
                                                        .notiTitle,
                                                    style: GoogleFonts.poppins(
                                                        color:
                                                            HexColor("3A3A3A"),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  notificationList[index]
                                                      .detail,
                                                  style: GoogleFonts.poppins(
                                                      color: HexColor("AFAFAF"),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
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
                "assets/icons/notification empty.png",
              ),
            );
          }),
    );
  }
}
