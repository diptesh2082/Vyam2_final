import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vyam_2_final/api/api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../OrderDetails/order_details.dart';

class ActiveEvent extends StatelessWidget {
  ActiveBookingApi activeBookingApi = ActiveBookingApi();
  ActiveEvent({
    Key? key,
    required double width,
  })  : _width = width,
        super(key: key);

  final double _width;
  List events = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: activeBookingApi.getActiveBooking,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            final data = snapshot.requireData;
            return Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ListView.builder(
                  itemCount: data.size,
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
                                        orderList: data.docs,
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
                                                data.docs[index]['id'],
                                            style: GoogleFonts.poppins(
                                                color: HexColor("3A3A3A"),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            data.docs[index]['gym_name'],
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
                                                data.docs[index]['location'],
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
                                          if (data.docs[index]["workout"]
                                                  .contains("months") ||
                                              data.docs[index]["workout"]
                                                  .contains("Months") ||
                                              data.docs[index]["workout"]
                                                  .contains("month"))
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
                                                  data.docs[index]['workout']
                                                      .toUpperCase(),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: HexColor("3A3A3A"),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          if (data.docs[index]['workout']
                                                  .contains("Pay") ||
                                              data.docs[index]['workout']
                                                  .contains("pay"))
                                            Text(
                                              data.docs[index]['workout']
                                                  .toUpperCase(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  color: HexColor("3A3A3A"),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Ends on : ",
                                                style: GoogleFonts.poppins(
                                                    color: HexColor("A3A3A3"),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                data.docs[index]['end_date'],
                                                style: GoogleFonts.poppins(
                                                    color: HexColor("A3A3A3"),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
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
                                                data.docs[index]['type']
                                                    .toUpperCase(),
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
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "http://via.placeholder.com/200x150",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                            colorFilter: const ColorFilter.mode(
                                                Colors.red,
                                                BlendMode.colorBurn)),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                )
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
