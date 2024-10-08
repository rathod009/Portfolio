import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/utils/certifications_utils.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widget/certifications_card.dart';
import 'package:portfolio/widget/custom_text_heading.dart';

class CertificateMobileTab extends StatelessWidget {
  const CertificateMobileTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const CustomSectionHeading(
          text: "\nCertifications",
        ),
        const CustomSectionSubHeading(
          text: "Here are some of the certifications I've earned :)\n\n",
        ),
        CarouselSlider.builder(
          itemCount: CertificationsUtils.titles.length,
          itemBuilder: (BuildContext context, int itemIndex, int i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: CertificateCard(
              certificate: CertificationsUtils.certificates[i],
              certificateTitle: CertificationsUtils.titles[i],
            ),
          ),
          options: CarouselOptions(
            height: height * 0.36,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: false,
          ),
        ),
        Space.y!,
        SizedBox(
            height: AppDimensions.normalize(16),
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
    );
  }
}
