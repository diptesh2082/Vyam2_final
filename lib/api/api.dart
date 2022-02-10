import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  final FirebaseFirestore getUserDetails = FirebaseFirestore.instance;

  void getUserData() async {
    print("rishabh");
    getUserDetails
        .collection("user_details")
        .doc("8859451134")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print(documentSnapshot);
      }
    });
  }
}
