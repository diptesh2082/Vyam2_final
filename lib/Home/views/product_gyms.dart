import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyam_2_final/Home/bookings/gym_details.dart';
import 'package:vyam_2_final/controllers/packages/packages.dart';

class ProductGyms extends StatelessWidget {


  // const ProductGyms({Key? key}) : super(key: key);
  const ProductGyms( this.controller,this.length);
  final List controller;
  final double length;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width*.94,
      child: SingleChildScrollView(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.length,
          itemBuilder: (context,int index){
            return Column(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>const GymDetails());
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          controller[index].imageAssets,
                          fit: BoxFit.cover,
                          height: size.height*.25,
                          width: size.width*.94,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: size.height*.009,
                      left: 5,
                      child: Container(
                        height: size.height*.078,
                        width: size.width*.45,
                        color: Colors.black26,
                        padding: const EdgeInsets.only(left: 8, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Transformers Gym",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Bus stand, Barakar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: size.height*.008,
                      child: Container(
                        color: Colors.black26,
                        alignment: Alignment.bottomRight,
                        height: size.height*.09,
                        width: size.width*.22,
                        padding: const EdgeInsets.only(right: 8, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                // SvgPicture.asset(
                                //     'assets/Icons/rating star small.svg'),
                                Icon(
                                  CupertinoIcons.star_lefthalf_fill,
                                  color: Colors.yellow,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "4.7",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                // SvgPicture.asset(
                                //   'assets/Icons/Location.svg',
                                //   color: Colors.white,
                                // ),
                                Icon(
                                  CupertinoIcons.location,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "1 KM",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            );
          },
          // itemCount: 1,
          // children: [
          //
          // ],
        ),
      ),
    );
  }
}