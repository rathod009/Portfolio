import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/animations/entrance_fader.dart';
import 'package:portfolio/configs/configs.dart';

import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widget/social_links.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 1.025,
      padding: Space.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 40,
            right: 60,
            child: Opacity(
              opacity: 1,
              child: EntranceFader(
                offset: const Offset(0, 0),
                delay: const Duration(seconds: 1),
                duration: const Duration(milliseconds: 600),
                child: Image.asset(
                  StaticUtils.blackWhitePhoto,
                  height: size.width < 1200
                      ? size.height * 0.55
                      : size.height * 0.65,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              AppDimensions.normalize(30),
              AppDimensions.normalize(40),
              0,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Welcome to my Portfolio! ',
                      style: AppText.b1!.copyWith(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    EntranceFader(
                      offset: const Offset(0, 0),
                      delay: const Duration(seconds: 2),
                      duration: const Duration(milliseconds: 800),
                      child: Image.asset(
                        StaticUtils.hi,
                        height: AppDimensions.normalize(12),
                      ),
                    ),
                  ],
                ),
                Space.y1!,
                Text(
                  "BHUMIK RATHOD",
                  style: AppText.h1!.copyWith(
                    fontFamily: 'Montserrat',
                    fontSize: AppDimensions.normalize(25),
                    fontWeight: FontWeight.w200,
                  ),
                ),
                EntranceFader(
                  offset: const Offset(-10, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: AppTheme.c!.primary!,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            ' Flutter Developer',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1,
                          ),
                          TyperAnimatedText(
                            ' UI/UX Enthusiast',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1,
                          ),
                          TyperAnimatedText(
                            ' A friend :)',
                            speed: const Duration(milliseconds: 50),
                            textStyle: AppText.b1,
                          ),
                        ],
                        isRepeatingAnimation: true,
                      ),
                    ],
                  ),
                ),
                Space.y2!,
                const SocialLinks(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
