import 'package:flutter/material.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/utils/about_utils.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/utils/work_utils.dart';
import 'package:portfolio/widget/custom_text_heading.dart';
import 'package:portfolio/widget/sparkle_outline_btn.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/widget/community_button.dart';
import 'package:portfolio/widget/tech_widget.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: Space.h,
      child: Column(
        children: [
          const CustomSectionHeading(
            text: '\nAbout Me',
          ),
          Space.x!,
          ClipOval(
            child: Image.asset(
              StaticUtils.mobilePhoto,
              height: height * 0.28,
              width: height * 0.28,
              fit: BoxFit.cover,
            ),
          ),
          Space.x!,
          Text(
              "Who am I?",
              style: AppText.b2!.copyWith(
                color: AppTheme.c!.primary,
              ),
            ),
          Space.y!,
          Text(
            AboutUtils.aboutMeHeadline,
            style: AppText.b2b!.copyWith(
              fontFamily: 'Montserrat',
            ),
          ),
          Space.y!,
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
              AboutUtils.aboutMeDetail,
              style: AppText.l1!.copyWith(
                height: 1.5,
                letterSpacing: 0.5,
                fontFamily: 'Montserrat',
              ),
            ),
            ),
          ),
          Space.x!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          Space.x!,
          Text(
            'Technologies I have worked with:',
            style: AppText.b2!.copyWith(
              color: AppTheme.c!.primary,
            ),
          ),
          Space.y!,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: kTools
                .map(
                  (e) => ToolTechWidget(techName: e),
                )
                .toList(),
          ),
          Space.x!,
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          Space.y1!,
          const SparkleOutlinedButton(), // Use the new widget
          Space.y1!,
          Wrap(
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: WorkUtils.logos
                  .asMap()
                  .entries
                  .map(
                    (e) => CommunityIconBtn(
                      icon: e.value,
                      link: WorkUtils.communityLinks[e.key],
                      height: WorkUtils.communityLogoHeight[e.key],
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
