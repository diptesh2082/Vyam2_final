import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyam2/review_screen.dart';
//import 'package:carousel_pro/carousel_pro.dart';
import 'package:vyam2/timings.dart';
import 'package:vyam2/know_trainer.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen1(),
      ),
      designSize: const Size(390, 1734),
    );
  }
}

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List trainers = [
    "assets/trainer1.png",
    "assets/trainer2.png",
    "assets/trainer3.png",
  ];

  final images = [
    "assets/rectangle_14.png",
    "assets/transf1.jpeg",
    "assets/transf2.jpeg",
    "assets/transf3.jpeg",
    "assets/transf5.jpeg",
  ];

  final trainername = ['Jake Paul', 'Jim Harry', 'Kim Jhonas'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            child: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              label: const Text(
                'Explore Packages',
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.white),
              ),
              backgroundColor: Colors.black,
              onPressed: null,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
            color: Colors.white30,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
                child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                  //scrollDirection: Axis.vertical,
//                  shrinkWrap: true,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CarouselSlider.builder(
                                itemCount: images.length,
                                itemBuilder: (context, index, realIndex) {
                                  final image = images[index];
                                  return gymImages(image, index);
                                },
                                options: CarouselOptions(
                                  autoPlay: true,
                                  viewportFraction: 1,
                                )),
                          ],
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: const [
                        Text(
                          'Transformers Gym',
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Spacer(),
                        Text('OPEN NOW',
                            style: TextStyle(
                                fontFamily: 'poppins',
                                color: Colors.lightGreen,
                                fontSize: 12,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005),
                    Row(children: const [
                      Icon(
                        Icons.location_on,
                        size: 18,
                      ),
                      Text('Barakar',
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 14)),
                      Spacer(),
                      Icon(Icons.assistant_direction, color: Colors.green),
                      Text('        ')
                    ]),
                    Row(children: const [
                      Spacer(),
                      Text('Navigate',
                          style: TextStyle(
                              fontFamily: 'poppins',
                              color: Colors.green,
                              fontSize: 8,
                              fontWeight: FontWeight.w500)),
                      Text('     ')
                    ]),
                    const Text('Bus stand, Barakar, near pratham lodge',
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.028),
                    FittedBox(
                      child: Row(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            height: 55,
                            width: 51,
                            //color: Colors.amber,
                            decoration: const BoxDecoration(
                                color: Colors.amber,
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/time_circle.png"))),
                          ),
                        ),
                        IntrinsicHeight(
                            child: Row(
                          children: [
                            Column(
                              children: const [
                                Text(' Morning (Mon-Sat)',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        color: Colors.grey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(height: 10),
                                Text('6.00AM-12.00PM',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 10)),
                              ],
                            ),
                            const VerticalDivider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(' Evening (Mon-Sat)',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                        fontSize: 10)),
                                SizedBox(height: 10),
                                Text('4.00PM-11.00PM',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 10)),
                              ],
                            ),
                            const VerticalDivider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(' Sunday',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                        fontSize: 10)),
                                SizedBox(height: 10),
                                Text(' Closed',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10)),
                              ],
                            ),
                          ],
                        )),
                      ]),
                    ),
                    Row(
                      children: [
                        const Text(' '),
                        const Spacer(),
                        GestureDetector(
                          child: const Text("View more",
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  color: Colors.green,
                                  fontSize: 12)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Timing()));
                          },
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.green,
                          size: 20,
                        )
                      ],
                    ),
                    const Text('Description',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        )),
                    const SizedBox(height: 12),
                    const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipscing elit. Sited turpis curabitur sed sed ut lacus vulputate sit. Sit lacus metus quis erat nec mattis erat ac ',
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 12)),
                    const Text('Read more',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 12)),
                    const SizedBox(height: 12),
                    const Text('Amenities',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w700,
                        )),
                    const SizedBox(height: 12),
                    FittedBox(
                        child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 25,
                          width: 40,
                          child: const Icon(
                            Icons.ac_unit,
                            size: 11,
                          ),
                          //color: Colors.amber,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 40,
                          child: const Icon(
                            Icons.lock_rounded,
                            size: 11,
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 40,
                          child: const Icon(
                            Icons.car_repair,
                            size: 11,
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 40,
                          child: const Icon(
                            Icons.person_outline,
                            size: 11,
                          ),
                          //color: Colors.amber,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'A/C',
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                        Text(
                          'Locker',
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                        Text(
                          'Parking',
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                        Text(
                          'P/T',
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const Text('Workouts',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w700,
                        )),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.070,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: AutoSizeText(
                            'Boxing | Cardio | Personal Training | Crossfit |  Zumba | Weight Training.',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                            maxLines: 3,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4.7,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Trainers',
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    Spacer(),
                                    GestureDetector(
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TrainerScreen()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 9,
                                child: ListView.builder(
                                    itemCount: trainers.length,
                                    physics: const PageScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Container(
                                            height: 65,
                                            width: 65,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                //border: Border.all(width: 1),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        trainers[index]),
                                                    fit: BoxFit.cover)),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                                child: ListView.builder(
                                    itemCount: trainername.length,
                                    physics: const PageScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Text(
                                            trainername[index],
                                            style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.09,
                                          ),
                                        ],
                                      );
                                    }),
                              )
                            ],
                          )),
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('Reviews',
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.050,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Text(
                                    '4.7',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    ' | ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    '(113 reviews)',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 18,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Review()));
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Rules',
                                    style: TextStyle(
                                      fontFamily: 'poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.015,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "•  Bring your towel and use it.",
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                    ),
                                    Text("•  Bring seperate shoes.",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w400,
                                        )),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                    ),
                                    Text("•  Re-rack equipments",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w400,
                                        )),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.015,
                                    ),
                                    Text("•  No heavy lifting without spotter",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text('Safety protocols',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    FittedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 5, color: Colors.white),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/safe1.png'),
                                              // fit: BoxFit.cover
                                            )),
                                      ),
                                      AutoSizeText(
                                        'Best in class safety',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey))),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 5, color: Colors.white),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/safe2.png'),
                                              // fit: BoxFit.cover
                                            )),
                                      ),
                                      const AutoSizeText(
                                        'Proper sanitised equipments',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                  )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 5, color: Colors.white),
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/safe3.png'),
                                              // fit: BoxFit.cover
                                            )),
                                      ),
                                      const AutoSizeText(
                                        'Social Distancing at all times',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                  ]),
            ))));
  }

  Widget gymImages(String images, int index) => Container(
        height: 70,
        width: double.infinity,
        child: Image.asset(
          images,
          fit: BoxFit.cover,
        ),
      );
}