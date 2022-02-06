import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vyam_2_final/Home/home_page.dart';
import 'package:vyam_2_final/colors/color.dart';


class RegistrationPage extends StatefulWidget {
  static String id = "/registration_page";
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  File? image;
  Future pickImage(ImageSource imageType) async {
    try{
      var image = await ImagePicker().pickImage(source:ImageSource.gallery);
      if (image==null) return;
      final imageTemporary = File(image.path);
      setState(() {
        image = imageTemporary as XFile?;
      });
      Get.back();
    }catch(error){
      debugPrint(error.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          leading: IconButton(
            icon: const Icon(
                Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
          },
          ),
          title: const Text(""
              "Register",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      body: Form(
        child: ListView(
            children:  [
              Padding(
                padding: EdgeInsets.only(top: size.height/15),
                child: Stack(
                  children: [
                    Positioned(
                      child: Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                            radius: size.width/7,
                          backgroundColor: Colors.amberAccent,
                          child: IconButton(
                            iconSize: size.width*.24,
                            onPressed: (){
                              // pickImage(ImageSource.gallery);
                            },
                            icon: Icon(
                                Icons.camera_alt_outlined,
                              size: size.width*.11,
                              color: Colors.black87,
                            ),
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.center,
                        child: ClipOval(
                          // child: image != null ? Image.file(
                          //     image!,
                          //
                          // ):
                          child:IconButton(
                            iconSize: size.width*.24,
                            onPressed: (){
                              // pickImage(ImageSource.gallery);
                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              size: size.width*.11,
                              color: Colors.black87,
                            ),
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black87,
                          width: 2
                        )
                    ),
                    labelText: "First name",
                    fillColor: Colors.orangeAccent,
                    hoverColor: Colors.orangeAccent,
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)
                    )
                  ),
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.orangeAccent,
                  // autofocus: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 8),
                child: TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black87,
                              width: 2
                          )
                      ),
                      labelText: "Last name",
                      fillColor: Colors.orangeAccent,
                      hoverColor: Colors.orangeAccent,
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)
                      )
                  ),
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.orangeAccent,
                  // autofocus: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 8),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black87,
                              width: 2
                          )
                      ),
                      labelText: "Email",
                      fillColor: Colors.orangeAccent,
                      hoverColor: Colors.orangeAccent,
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)
                      )
                  ),
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.orangeAccent,
                  // autofocus: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                child: Container(
                    decoration: BoxDecoration(
                        color: backgroundColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                              "Gender",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SizedBox(
                                  width: size.width*.22,
                                  child: ElevatedButton(onPressed: (){

                                  },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white
                                      ),
                                      child: const Text("Male",
                                        style: TextStyle(
                                            color: Colors.black87
                                        ),
                                      )
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: SizedBox(
                                width: size.width*.22,
                                child: ElevatedButton(onPressed: (){

                                },

                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white
                                    ),
                                    child: const Text(
                                        "Female",
                                      style: TextStyle(
                                        color: Colors.black87
                                      ),
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height*.05,
                        ),

                      ],
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: size.width*.2,
                  height: size.height/17,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(HomePage.id);
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
              ),
            ],
        ),
      ),
    );
  }
}
