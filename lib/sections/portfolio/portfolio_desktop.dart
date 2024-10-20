import 'package:flutter/material.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widget/custom_text_heading.dart';
import 'package:portfolio/widget/project_card.dart';

class PortfolioDesktop extends StatefulWidget {
  const PortfolioDesktop({super.key});

  @override
  State<PortfolioDesktop> createState() => _PortfolioDesktopState();
}

class _PortfolioDesktopState extends State<PortfolioDesktop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 160),
      child: Container(
        padding: Space.h!,
        child: Column(
          children: [
            const CustomSectionHeading(
              text: "\nPortfolio",
            ),
            const CustomSectionSubHeading(
              text: "Here are few samples of my previous work :)\n",
            ),
            GridView.builder(
              shrinkWrap: true, // Ensures GridView takes only necessary space
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 4 items per row
                mainAxisSpacing: 20.0, // Spacing between rows
                crossAxisSpacing: 0.0, // Spacing between columns
                childAspectRatio: 1.80, // Adjust to control card height/width ratio
              ),
              itemCount: ProjectUtils.banners.length,
              itemBuilder: (context, index) {
                return ProjectCard(
                  banner: ProjectUtils.banners[index],
                  projectIcon: ProjectUtils.icons[index],
                  projectLink: ProjectUtils.links[index],
                  projectTitle: ProjectUtils.titles[index],
                  projectDescription: ProjectUtils.description[index],
                );
              },
            ),
            Space.y1!,
            SizedBox(
              height: AppDimensions.normalize(14),
              width: AppDimensions.normalize(50),
              child: OutlinedButton(
                onPressed: () => openURL(StaticUtils.gitHub),
                child: Text(
                  'See More',
                  style: AppText.l1b,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
