import 'package:flutter/material.dart';

class ContactUtils {
  static const List<IconData> contactIcon = [
    Icons.home,
    Icons.phone,
    Icons.mail,
  ];

  static const List<String> titles = [
    "Location",
    "Phone",
    "Email",
  ];

  static const List<String> details = [
    "Anand, Gujarat, India",
    "+91 7046392688",
    "bhumikrathod09@gmail.com",
  ];
}


// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ContactUtils {
//   static const List<IconData> contactIcon = [
//     Icons.home,
//     Icons.phone,
//     Icons.mail,
//   ];

//   static const List<String> titles = [
//     "Location",
//     "Phone",
//     "Email",
//   ];

//   static const List<String> details = [
//     "Anand, Gujarat, India",
//     "+91 7046392688",
//     "bhumikrathod09@gmail.com",
//   ];

//   static void openMap() async {
//     const mapUrl = "https://www.google.com/maps?q=Anand,Gujarat,India";
//     if (await canLaunch(mapUrl)) {
//       await launch(mapUrl);
//     } else {
//       throw 'Could not launch $mapUrl';
//     }
//   }

//   static void openDialPad() async {
//     const phoneNumber = "tel:+917046392688";
//     if (await canLaunch(phoneNumber)) {
//       await launch(phoneNumber);
//     } else {
//       throw 'Could not launch $phoneNumber';
//     }
//   }

//   static void openEmail() async {
//     final Uri emailLaunchUri = Uri(
//       scheme: 'mailto',
//       path: 'bhumikrathod09@gmail.com',
//       queryParameters: {
//         'subject': 'Hello Bhumik'
//       },
//     );
//     if (await canLaunch(emailLaunchUri.toString())) {
//       await launch(emailLaunchUri.toString());
//     } else {
//       throw 'Could not launch ${emailLaunchUri.toString()}';
//     }
//   }
// }