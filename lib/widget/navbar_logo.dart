import 'package:flutter/material.dart';
import 'package:portfolio/configs/app_typography.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "< ",
          style: AppText.b1!.copyWith(color: Colors.deepOrangeAccent), // Changed color to blue
        ),
        Text(
          "Rathod",
          style: AppText.b1b!.copyWith(
            fontFamily: 'MonotypeCorsiva',
            color: Colors.lightBlue, // Changed color to blue
          ),
        ),
        Text(
          MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
          style: AppText.b1!.copyWith(color: Colors.deepOrangeAccent), // Changed color to blue
        ),
      ],
    );
  }
}
