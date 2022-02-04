import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyam_2_final/Home/views/product_gyms.dart';
import 'package:vyam_2_final/controllers/home_controller.dart';

import 'gyms.dart';

class FirstHome extends StatelessWidget {

  final backgroundColor = Colors.grey[200];
  final appBarColor = Colors.grey[300];
  final HomeController controller = Get.put(HomeController());
  FirstHome({Key? key}) : super(key: key);


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
          transform:  Matrix4.translationValues(-20.0, 0.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
              Text(
                "2972 Westheimer Rd, Illinois 85486 ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * .02
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
              Get.back();
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
                    borderRadius: BorderRadius.circular(10)
                ),
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
              SizedBox(
                height: size.height*.18,
                child: ListView.builder(
                  // controller: _controller.,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.boards.length,
                  itemBuilder: (context,int index){
                    return SizedBox(
                      height: 120,
                      child: Row(
                        children: [
                          Image.asset(
                              controller.boards[index].imageAssets
                          ),
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
                height: size.height*.2,
                child: ListView.builder(
                  itemCount: controller.OptionsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,int index){
                    return SizedBox(
                      height: 150,
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const GymOption()));
                              },
                              child: Image.asset(controller.OptionsList[index].imageAssets)),
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
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              ProductGyms(controller.GymLists,size.height*.6)

            ],
          ),
        ),
      ),
    );
  }
}

