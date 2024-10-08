import 'package:flutter/material.dart';
import 'package:portfolio/sections/about/about.dart';
import 'package:portfolio/sections/certifications/certifications.dart';
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
  static const String university = 'assets/work/nirma.png';
  static const String clarionit = 'assets/work/clarionit.png';
  static const String techelecon = 'assets/work/tech_elecon.png';
  

  // services
  static const String appDev = 'assets/services/app.png';
  static const String frontend = 'assets/services/web.png';
  static const String uiux = 'assets/services/ui.png';
  static const String openSource = 'assets/services/open.png';
  static const String openSourceBlack = 'assets/services/open_b.png';
  static const String videoEditing = 'assets/services/video.png';

  // Calling through Links
  static const List<String> socialIconURL = [
    "https://img.icons8.com/metro/308/ffffff/linkedin.png",
    "https://img.icons8.com/?size=100&id=16733&format=png&color=ffffff",
    "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
    "https://img.icons8.com/material-rounded/384/ffffff/github.png",
    "https://img.icons8.com/?size=100&id=30888&format=png&color=ffffff"    
  ];

  // Social media links
  static const List<String> socialLinks = [
    "https://linkedin.com/in/bhumik-rathod-235b8a148",
    "https://wa.me/+917046392688",
    "https://instagram.com/rathod_09",
    "https://github.com/rathod009",
    "https://discord.gg/3CMp8DWBwy"
  ];

  //Resume link
  static const String resume =
      'https://drive.google.com/file/d/1CZNAGHTh7CGvrD9GmAAA8_D2nes4dXtY/view?usp=sharing';

  //Github link
  static const String gitHub = 'https://github.com/rathod009';

  //Certifications link
  static const String certifications = 'https://drive.google.com/drive/folders/1vS7U3Spn0h2c3-wWjSogK2sMfxEbpN_I?usp=sharing';
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Services(),
    Certificate(),
    Portfolio(),
    Contact(),
    Footer(),
  ];
}
