import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../package_controller.dart';





class NearGymList extends StatelessWidget {
  const NearGymList({
    Key? key,
    required double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            SizedBox(
              height: 150.0,
              width: _width,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: nearGym.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          nearGym[index].image,
                          Positioned(
                              bottom: 30,
                              left: 20,
                              child: Text(
                                nearGym[index].title,
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              )),
                          Positioned(
                              bottom: 10,
                              left: 20,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  Text(
                                    nearGym[index].location,
                                    style: GoogleFonts.poppins(
                                        fontSize: 8,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )),
                          Positioned(
                              bottom: 30,
                              right: 20,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 8,
                                  ),
                                  Text(
                                    nearGym[index].rating,
                                    style: GoogleFonts.poppins(
                                        fontSize: 8,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )),
                          Positioned(
                              bottom: 10,
                              right: 20,
                              child: Text(
                                "Starting - \$ " + "${nearGym[index].price}",
                                style: GoogleFonts.poppins(
                                    fontSize: 8,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        );
      },
    );
  }
}

