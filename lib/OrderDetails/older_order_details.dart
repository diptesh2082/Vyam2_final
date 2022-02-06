import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:vyambooking/List/list.dart';

class OlderOderDetails extends StatefulWidget {
  const OlderOderDetails(
      {Key? key, required this.index, required this.orderList})
      : super(key: key);
  final index;
  final orderList;

  @override
  _OlderOderDetailsState createState() => _OlderOderDetailsState();
}

class _OlderOderDetailsState extends State<OlderOderDetails> {
  List getOderDetails = [];

  @override
  void initState() {
    getOderDetails = widget.orderList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: HexColor("3A3A3A"),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Order Details",
          style: GoogleFonts.poppins(
              color: HexColor("3A3A3A"),
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 8,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: getOderDetails[widget.index].gymImage),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 22.0, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Booking ID : " +
                                      getOderDetails[widget.index].bookindID,
                                  style: GoogleFonts.poppins(
                                      color: HexColor("3A3A3A"),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  getOderDetails[widget.index].gymName,
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
                                      getOderDetails[widget.index].location,
                                      style: GoogleFonts.poppins(
                                          color: HexColor("3A3A3A"),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      getOderDetails[widget.index].date,
                                      style: GoogleFonts.poppins(
                                          color: HexColor("A3A3A3"),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 35.0),
                                      child: Image.asset(
                                        "assets/icons/Bookings-bx_bxs-direction-right.png",
                                        height: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: HexColor("F2994A"),
                                          shape: BoxShape.circle),
                                      width: 5,
                                      height: 5,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Completed",
                                          style: GoogleFonts.poppins(
                                              color: HexColor("3A3A3A"),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Navigate",
                                                style: GoogleFonts.poppins(
                                                    color: HexColor("49C000"),
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: HexColor("FFC700"),
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: HexColor("FFC700"),
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: HexColor("FFC700"),
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: HexColor("FFC700"),
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: HexColor("FFC700"),
                                      size: 15,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      child: Text(
                                        "Write a review",
                                        style: GoogleFonts.poppins(
                                            decoration:
                                                TextDecoration.underline,
                                            color: HexColor("3A3A3A"),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      size: 15,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 8,
            child: Container(
              width: _width * 0.95,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(19.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Workout",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        if (getOderDetails[widget.index]
                            .bookingPeriod
                            .contains("Pay"))
                          Text(
                            getOderDetails[widget.index].bookingPeriod,
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        if (getOderDetails[widget.index]
                            .bookingPeriod
                            .contains("Months"))
                          Row(
                            children: [
                              Text(
                                "Gym - ",
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                getOderDetails[widget.index].bookingPeriod,
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Package",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          getOderDetails[widget.index].bookingPeriod,
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Start date",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          getOderDetails[widget.index].startDate,
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Valid upto",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          getOderDetails[widget.index].endDate,
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 8,
            child: Container(
              width: _width * 0.95,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(19.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Total amount",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          "\$" "${getOderDetails[widget.index].amount}",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Discount",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          "\$" "${getOderDetails[widget.index].discount}",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Promo code",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        Text(
                          "${getOderDetails[widget.index].promocode}",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Grand Total",
                          style: GoogleFonts.poppins(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: HexColor("27AE60")),
                        ),
                        const Spacer(),
                        Text(
                          "\$"
                          "${getOderDetails[widget.index].amount - getOderDetails[widget.index].discount}",
                          style: GoogleFonts.poppins(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: HexColor("27AE60")),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber, shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                        "assets/icons/Bookings-order details-vuesax-linear-vuesax-linear-message-question.png"),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
