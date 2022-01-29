import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:vyam_2_final/colors/color.dart';
import 'package:vyam_2_final/controllers/onbording_controller.dart';


class Onboarding1 extends StatelessWidget {
  final controller = OnboardingController();

  Onboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: PageView.builder(
              itemCount: controller.onboardingPages.length,
              itemBuilder: (itemBuilder,index){
            return Container(
                color: backgroundColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: size.height/25,
                          width: size.width/5,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                              ),
                              onPressed: (){},
                              child: const Text("Skip")
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      controller.onboardingPages[index].imageAssets,
                      height: size.height/2.1,
                      width: size.width/1.12,
                      fit: BoxFit.fitWidth,
                    ),
                    // SizedBox(
                    //   height: size.height/65,
                    // ),
                    Container(
                      height: size.height/2.8,
                      width: size.width/1.18,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(36)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.onboardingPages[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25,
                              fontFamily: "Poppins",
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                           Text(
                             controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black38,
                              decoration: TextDecoration.none,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: size.height/20,
                            width: size.width/3,
                            child: ElevatedButton(
                                onPressed: (){

                                },
                                child: const Text("Next"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
            );
          })

        )
    );
  }
}
