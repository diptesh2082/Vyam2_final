import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vyam_2_final/controllers/gym_detail.dart';
// import 'package:vyambooking/List/list.dart';
// import 'package:vyambooking/OrderDetails/order_details.dart';

class UpcomingEvent extends StatelessWidget {
  UpcomingEvent({
    Key? key,
    required double width,
  })  : _width = width,
        super(key: key);

  final double _width;
  List events = [];

  Future upcomingEventsList() async {
    events = upcomingItems;
    await Future.delayed(const Duration(milliseconds: 500));
    if (events.isNotEmpty) {
      return events;
    }
    if (events.isEmpty) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: upcomingEventsList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ListView.builder(
                  itemCount: upcomingItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 8,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            width: _width * 0.9,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 22.0, left: 18, bottom: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Booking ID : " +
                                                upcomingItems[index].bookindID,
                                            style: GoogleFonts.poppins(
                                                color: HexColor("3A3A3A"),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            upcomingItems[index].gymName,
                                            style: GoogleFonts.poppins(
                                                color: HexColor("3A3A3A"),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on,
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 4.5,
                                              ),
                                              Text(
                                                upcomingItems[index].location,
                                                style: GoogleFonts.poppins(
                                                    color: HexColor("3A3A3A"),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          if (upcomingItems[index]
                                              .bookingPeriod
                                              .contains("Month"))
                                            Row(
                                              children: [
                                                Text(
                                                  "Package : ",
                                                  style: GoogleFonts.poppins(
                                                      color: HexColor("3A3A3A"),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  upcomingItems[index]
                                                      .bookingPeriod,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: HexColor("3A3A3A"),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          if (upcomingItems[index]
                                              .bookingPeriod
                                              .contains("Pay"))
                                            Text(
                                              upcomingItems[index]
                                                  .bookingPeriod,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: HexColor("3A3A3A"),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            upcomingItems[index].date,
                                            style: GoogleFonts.poppins(
                                                color: HexColor("A3A3A3"),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: HexColor("F2994A"),
                                                    shape: BoxShape.circle),
                                                width: 8,
                                                height: 8,
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                upcomingItems[index].eventType,
                                                style: GoogleFonts.poppins(
                                                    color: HexColor("3A3A3A"),
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: upcomingItems[index].gymImage),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }
          return Center(
            child: Image.asset(
              "assets/icons/bookingEmpty.png",
              height: _width * 0.8,
            ),
          );
        });
  }
}
