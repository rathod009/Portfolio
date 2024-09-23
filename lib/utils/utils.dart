import 'package:flutter/material.dart';
import 'package:portfolio/sections/about/about.dart';
import 'package:portfolio/sections/contact/contact.dart';
import 'package:portfolio/sections/home/home.dart';
import 'package:portfolio/sections/portfolio/portfolio.dart';
import 'package:portfolio/sections/services/services.dart';
import 'package:portfolio/widget/footer.dart';

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // photos
  static const String mobilePhoto = 'assets/photos/mobile.gif';
  static const String coloredPhoto = 'assets/photos/colored.png';
  static const String blackWhitePhoto = 'assets/photos/black-white.png';

  // work
  static const String techelecon = 'assets/work/tech_elecon.png';
  static const String university = 'assets/work/nirma.png';

  // services
  static const String uiux = 'assets/services/ui.png';
  static const String appDev = 'assets/services/app.png';
  static const String openSource = 'assets/services/open.png';
  static const String openSourceBlack = 'assets/services/open_b.png';

  // Calling through Links
  static const List<String> socialIconURL = [
    "https://img.icons8.com/metro/308/ffffff/linkedin.png",
    "https://img.icons8.com/?size=100&id=16733&format=png&color=ffffff",
    "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
    "https://img.icons8.com/material-rounded/384/ffffff/github.png",
    "https://img.icons8.com/?size=100&id=30888&format=png&color=ffffff"    
  ];

  static const List<String> socialLinks = [
    "https://linkedin.com/in/bhumik-rathod-235b8a148",
    "https://wa.me/+917046392688",
    "https://instagram.com/rathod_09",
    "https://github.com/rathod009",
    "https://discord.gg/3CMp8DWBwy"
  ];

  static const String resume =
      'https://drive.google.com/file/d/1JG1v95Kbb5KZSoko-h2JNgxXKPmT2o4d/view?usp=sharing';

  static const String gitHub = 'https://github.com/rathod009';
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Services(),
    // Certifications(),
    Portfolio(),
    Contact(),
    Footer(),
  ];
}
