import 'package:flutter/material.dart';
import 'package:portfolio/animations/bottom_animation.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/utils/contact_utils.dart';
import 'package:portfolio/widget/custom_text_heading.dart';
import 'package:portfolio/widget/contact_card.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(1, 1), // Consistent padding
      child: Column(
        children: [
          const CustomSectionHeading(
            text: "\nGet in Touch",
          ),
          const CustomSectionSubHeading(
            text: "Let's build something together :)\n\n",
          ),
          Space.y!,
          Wrap(
            alignment: WrapAlignment.center,
            spacing: AppDimensions.normalize(16), // Add spacing between cards
            runSpacing: AppDimensions.normalize(10),
            children: ContactUtils.contactIcon
                .asMap()
                .entries
                .map((e) => WidgetAnimator(
                      child: ContactCard(
                        contactIconData: e.value,
                        contactTitle: ContactUtils.titles[e.key],
                        contactDescription: ContactUtils.details[e.key],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
