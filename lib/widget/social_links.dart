import 'package:flutter/material.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/provider/app_provider.dart';
import 'package:portfolio/responsive/responsive.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:provider/provider.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    
    // Define the padding and icon size based on the screen size
    double padding = Responsive.isMobile(context) 
        ? AppDimensions.normalize(0.5) 
        : AppDimensions.normalize(1);
    double iconSize = Responsive.isMobile(context) 
        ? AppDimensions.normalize(8) 
        : AppDimensions.normalize(12);

    return Wrap(
      runSpacing: AppDimensions.normalize(10),
      alignment: WrapAlignment.center,
      children: StaticUtils.socialIconURL
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding: EdgeInsets.all(padding),
              child: IconButton(
                highlightColor: Colors.white54,
                splashRadius: AppDimensions.normalize(10),
                icon: Image.network(
                  e.value,
                  color: appProvider.isDark ? Colors.black : Colors.black,
                  height: iconSize,
                ),
                iconSize: iconSize,
                onPressed: () => openURL(
                  StaticUtils.socialLinks[e.key],
                ),
                hoverColor: AppTheme.c!.primary!,
              ),
            ),
          )
          .toList(),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:portfolio/configs/configs.dart';
// import 'package:portfolio/constants.dart';
// import 'package:portfolio/provider/app_provider.dart';
// import 'package:portfolio/responsive/responsive.dart';
// import 'package:portfolio/utils/utils.dart';
// import 'package:provider/provider.dart';

// class SocialLinks extends StatelessWidget {
//   const SocialLinks({
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final appProvider = Provider.of<AppProvider>(context);
//     return Wrap(
//       runSpacing: AppDimensions.normalize(10),
//       alignment: WrapAlignment.center,
//       children: StaticUtils.socialIconURL
//           .asMap()
//           .entries
//           .map(
//             (e) => Padding(
//               padding:
//                   Responsive.isMobile(context) ? Space.all(0.2, 0) : Space.h!,
//               child: IconButton(
//                 highlightColor: Colors.white54,
//                 splashRadius: AppDimensions.normalize(12),
//                 icon: Image.network(
//                   e.value,
//                   color: appProvider.isDark ? Colors.white : Colors.black,
//                   height: Responsive.isMobile(context)
//                       ? AppDimensions.normalize(10)
//                       : null,
//                 ),
//                 iconSize: Responsive.isMobile(context)
//                     ? AppDimensions.normalize(10)
//                     : AppDimensions.normalize(15),
//                 onPressed: () => openURL(
//                   StaticUtils.socialLinks[e.key],
//                 ),
//                 hoverColor: AppTheme.c!.primary!,
//               ),
//             ),
//           )
//           .toList(),
//     );
//   }
// }
