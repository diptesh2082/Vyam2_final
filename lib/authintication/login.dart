import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyam_2_final/authintication/otp_screen.dart';
import 'package:vyam_2_final/colors/color.dart';
import 'package:vyam_2_final/controllers/onbording_controller.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                  color: backgroundColor,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/sign_up.png",
                        height: size.height / 2.5,
                        width: size.width /1.08,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        height: size.height / 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0,left: 25.0,top:10),
                        child: Text(
                            "Find and book best gyms Online",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: size.width/18,
                              fontFamily: "Poppins",
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w800,
                            // fontStyle: FontStyle.italic
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height/50,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                              child: const Divider(
                                color: Colors.black,
                                height: 36,
                                thickness: 1,
                              )),
                        ),
                        const Text(
                            "Log in or sign up",
                          style: TextStyle(
                            fontSize: 15
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                              child: const Divider(
                                color: Colors.black,
                                height: 36,
                                thickness: 1,
                              )),
                        ),
                      ]
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: size.height / 15,
                      width: size.width / 1.15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width / 25,
                          ),
                          Container(
                            height: size.height / 35,
                            width: size.height / 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/icons/india_flag.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                              "+91",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,left:20,bottom: 8),
                            child: SizedBox(
                              height: size.height / 15,
                              width: size.width / 2,
                              child: const TextField(
                                // controller: phoneController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter phone number"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                      SizedBox(
                        height: size.height/40,
                      ),
                      SizedBox(
                        width: size.width/1.2,
                        height: size.height/17,
                        child: ElevatedButton(
                          onPressed: () {
                              Get.toNamed(OtpPage.id);
                          },
                          child: const Text(
                              "Continue",
                            style: TextStyle(
                              fontSize: 17.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: elevatedButtonColor
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                              child: const Divider(
                                color: Colors.black,
                                height: 30,
                                thickness: .8,
                              )),
                        ),
                        const Text(
                          "Or",
                          style: TextStyle(
                              fontSize: 15
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                              child: const Divider(
                                color: Colors.black,
                                height: 30,
                                thickness: .8,
                              )),
                        ),
                      ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 65,
                            width: 65,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: IconButton(onPressed: (){

                            },
                                icon: Image.asset(
                                    "assets/icons/google.png",
                                )
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: IconButton(onPressed: (){

                            },
                                color: Colors.white,
                                // iconSize: 30,
                                icon: Image.asset(
                                  "assets/icons/facebook.png",

                                  // fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: size.width/2,
                        child: const Center(
                          child: Text(
                            "Continue means you agree to"
                              +"Terms of use Privacy Policy",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  )
              ),
            )
        ),
    );
  }
}
