import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:vyambooking/List/list.dart';
// import 'package:vyambooking/OrderDetails/order_details.dart';

import '../OrderDetails/order_details.dart';
import '../controllers/gym_detail.dart';

class ActiveEvent extends StatelessWidget {
  ActiveEvent({
    Key? key,
    required double width,
  })  : _width = width,
        super(key: key);

  final double _width;
  List events = [];

  Future ActiveEventsList() async {
    events = activeEventItems;
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
    return FutureBuilder(
        future: ActiveEventsList(),
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
                  itemCount: activeEventItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderDetails(
                                        index: index,
                                        orderList: activeEventItems,
                                      )));
                        },
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
                                          top: 22.0, left: 18, bottom: 22),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Booking ID : " +
                                                activeEventItems[index]
                                                    .bookindID,
                                            style: GoogleFonts.poppins(
                                                color: HexColor("3A3A3A"),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            activeEventItems[index].gymName,
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
                                                activeEventItems[index]
                                                    .location,
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
                                          if (activeEventItems[index]
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
                                                  activeEventItems[index]
                                                      .bookingPeriod,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: HexColor("3A3A3A"),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          if (activeEventItems[index]
                                              .bookingPeriod
                                              .contains("Pay"))
                                            Text(
                                              activeEventItems[index]
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
                                            activeEventItems[index].date,
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
                                                    color: HexColor("49C000"),
                                                    shape: BoxShape.circle),
                                                width: 8,
                                                height: 8,
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                activeEventItems[index]
                                                    .eventType,
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
                                    child: activeEventItems[index].gymImage),
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
