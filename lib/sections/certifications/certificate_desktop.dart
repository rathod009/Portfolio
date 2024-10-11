import 'package:flutter/material.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/utils/certifications_utils.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widget/certifications_card.dart';
import 'package:portfolio/widget/custom_text_heading.dart';

class CertificateDesktop extends StatefulWidget {
  const CertificateDesktop({super.key});

  @override
  State<CertificateDesktop> createState() => _CertificateDesktopState();
}

class _CertificateDesktopState extends State<CertificateDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.h!,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: "\nCertifications",
          ),
          const CustomSectionSubHeading(
            text: "Here are some of the certifications I've earned to enhance my skills and knowledge :)\n\n",
          ),
          GridView.builder(
            shrinkWrap: true, // Ensures it doesn't scroll separately
            physics: const NeverScrollableScrollPhysics(), // To prevent inner scrolling
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 4 items per row
              mainAxisSpacing: 0.0, // Spacing between rows
              crossAxisSpacing: 20.0, // Spacing between columns
              childAspectRatio: 1.5, // Adjust for card proportions
            ),
            itemCount: CertificationsUtils.certificates.length,
            itemBuilder: (context, index) {
              return CertificateCard(
                certificate: CertificationsUtils.certificates[index],
                certificateTitle: CertificationsUtils.titles[index],
              );
            },
          ),
          Space.y!,
          SizedBox(
            height: AppDimensions.normalize(14),
            width: AppDimensions.normalize(50),
            child: OutlinedButton(
              onPressed: () => openURL(StaticUtils.certifications),
              child: Text(
                'See More',
                style: AppText.l1b,
              ),
            ),
          )
        ],
      ),
    );
  }
}

// -----------------------------------OLD------------------------------------
// import 'package:flutter/material.dart';
// import 'package:portfolio/configs/configs.dart';
// import 'package:portfolio/constants.dart';
// import 'package:portfolio/utils/certifications_utils.dart';
// import 'package:portfolio/utils/utils.dart';
// import 'package:portfolio/widget/certifications_card.dart';
// import 'package:portfolio/widget/custom_text_heading.dart';

// class CertificateDesktop extends StatefulWidget {
//   const CertificateDesktop({super.key});

//   @override
//   State<CertificateDesktop> createState() => _CertificateDesktopState();
// }

// class _CertificateDesktopState extends State<CertificateDesktop> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: Space.h!,
//       child: Column(
//         children: [
//           const CustomSectionHeading(
//             text: "\nCertifications",
//           ),
//           const CustomSectionSubHeading(
//             text: "Here are some of the certifications I've earned to enhance my skills and knowledge :)\n\n",
//           ),
//           Wrap(
//             alignment: WrapAlignment.spaceEvenly,
//             crossAxisAlignment: WrapCrossAlignment.center,
//             runSpacing: AppDimensions.normalize(10),
//             children: CertificationsUtils.certificates
//                 .asMap()
//                 .entries
//                 .map(
//                   (e) => CertificateCard(
//                     certificate: e.value,
//                     certificateTitle: CertificationsUtils.titles[e.key],
//                   ),
//                 )
//                 .toList(),
//           ),
//           Space.y2!,
//           SizedBox(
//             height: AppDimensions.normalize(14),
//             width: AppDimensions.normalize(50),
//             child: OutlinedButton(
//               onPressed: () => openURL(StaticUtils.certifications),
//               child: Text(
//                 'See More',
//                 style: AppText.l1b,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
