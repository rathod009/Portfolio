import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/utils/project_utils.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widget/custom_text_heading.dart';
import 'package:portfolio/widget/project_card.dart';

class PortfolioMobileTab extends StatelessWidget {
  const PortfolioMobileTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const CustomSectionHeading(
          text: "\nPortfolio",
        ),
        const CustomSectionSubHeading(
          text: "Here are few samples of my previous work :)\n\n",
        ),
        CarouselSlider.builder(
          itemCount: ProjectUtils.titles.length,
          itemBuilder: (BuildContext context, int itemIndex, int i) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 32),
            child: ProjectCard(
              banner: ProjectUtils.banners[i],
              projectIcon: ProjectUtils.icons[i],
              projectLink: ProjectUtils.links[i],
              projectTitle: ProjectUtils.titles[i],
              projectDescription: ProjectUtils.description[i],
            ),
          ),
          options: CarouselOptions(
            height: height * 0.28,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enlargeCenterPage: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enableInfiniteScroll: false,
          ),
        ),
        Space.y1!,
        SizedBox(
          height: AppDimensions.normalize(16),
          width: AppDimensions.normalize(50),
          child: OutlinedButton(
            onPressed: () => openURL(StaticUtils.gitHub),
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
