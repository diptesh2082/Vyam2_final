import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

var number;

getNumber() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var getNumber = sharedPreferences.getString("number");
  number = getNumber.toString();
}

class UserDetails {
  final collectionRef = FirebaseFirestore.instance.collection('user_details');
  List userData = [];

  Future getData() async {
    try {
      await collectionRef.doc(number).get().then((value) {
        userData.add(value.data());
        return userData;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}

class NotificationApi {
  final Stream<QuerySnapshot> getnotification = FirebaseFirestore.instance
      .collection('user_details')
      .doc(number)
      .collection("notification")
      .snapshots();

  Future clearNotificationList() async {
    var remainderFirestore = FirebaseFirestore.instance
        .collection('user_details')
        .doc(number)
        .collection("notification");

    try {
      await remainderFirestore.get().then((value) {
        for (DocumentSnapshot ds in value.docs) {
          ds.reference.delete();
        }
      });
    } catch (e) {
      return null;
    }
  }
}

class CouponApi {
  String number = "8859451134";
  List couponList = [];
  Future getCouponData() async {
    var couponFirestore = FirebaseFirestore.instance.collection('coupon');

    try {
      await couponFirestore.get().then((value) {
        for (var result in value.docs) {
          couponList.add(result.data());
        }
      });
    } catch (e) {
      return null;
    }

    return couponList;
  }
}


// class bannerController extends Equatable{
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
//
// }

// class ProductApi extends Equatable{
//   final int id;
//   final String name;
//   final String address;
//
//   ProductApi(this.id, this.name, this.address);
//
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
//
// }

// class ProductApi {
//   final Stream<QuerySnapshot> getnotification = FirebaseFirestore.instance.
//   collection("product_details")
//       .doc("RBRQKBuboUVvDAriCCVe")
//       .collection("address")
//       .snapshots();
//
//   Future clearProductList() async {
//     var remainderFirestore = FirebaseFirestore.instance.
//     collection("product_details")
//         .doc("RBRQKBuboUVvDAriCCVe")
//         .collection("address");
//     try {
//       await remainderFirestore.get().then((value) {
//         for (DocumentSnapshot ds in value.docs) {
//           ds.reference.delete();
//         }
//       });
//     } catch (e) {
//       return null;
//     }
//   }
// }
class UpcomingApi {
  Stream<QuerySnapshot> getUpcomingEvents = FirebaseFirestore.instance
      .collection('user_details')
      .doc(number)
      .collection("bookings")
      .doc("upcoming")
      .collection("upcoming_booking")
      .snapshots();
}

class ActiveBookingApi {
  Stream<QuerySnapshot> getActiveBooking = FirebaseFirestore.instance
      .collection('user_details')
      .doc(number)
      .collection("bookings")
      .doc("active")
      .collection("active_booking")
      .snapshots();
}

class OlderBookingApi {
  Stream<QuerySnapshot> getOlderBooking = FirebaseFirestore.instance
      .collection('user_details')
      .doc(number)
      .collection("bookings")
      .doc("older")
      .collection("older_booking")
      .snapshots();
}
