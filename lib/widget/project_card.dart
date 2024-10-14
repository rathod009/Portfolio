import 'package:flutter/material.dart';
import 'package:portfolio/configs/configs.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/provider/app_provider.dart';
import 'package:provider/provider.dart';

class ProjectCard extends StatefulWidget {
  final String? banner;
  final String? projectLink;
  final String? projectIcon;
  final String projectTitle;
  final String projectDescription;
  final IconData? projectIconData;

  const ProjectCard({
    super.key,
    this.banner,
    this.projectIcon,
    this.projectLink,
    this.projectIconData,
    required this.projectTitle,
    required this.projectDescription,
  });

  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: widget.projectLink == null
          ? () {}
          : () => openURL(widget.projectLink!),
      onHover: (isHovering) {
        setState(() {
          isHover = isHovering;
        });
      },
      child: Container(
        margin: Space.h,
        padding: Space.all(),
        width: AppDimensions.normalize(130),
        decoration: BoxDecoration(
          color: appProvider.isDark ? Colors.grey[200] : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: (isHover ? Colors.cyanAccent : AppTheme.c!.primary)!
                  .withAlpha(100),
              blurRadius: 12.0,
              offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Stack(
          children: [
            // FadeInImage implementation as an alternative to Image.network
            // if (widget.banner != null)
            //   ClipRRect(
            //     borderRadius: BorderRadius.circular(5),
            //     child: FadeInImage.assetNetwork(
            //       placeholder: 'assets/projects/placeholder.gif',
            //       image: widget.banner!,
            //       height: height * 0.26,
            //       width: double.infinity,
            //       fit: BoxFit.contain,
            //       imageErrorBuilder: (context, error, stackTrace) {
            //         return Icon(
            //           Icons.broken_image,
            //           size: height * 0.1,
            //         ); // Gracefully handle loading error
            //       },
            //     ),
            //   ),

            if (widget.banner != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isHover ? 0.0 : 1.0, // Fade effect on hover
                  child: Image.network(
                    widget.banner!,
                    height: height * 0.26,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

            // Content Overlay on Hover
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isHover ? 1.0 : 0.0, // Show content only on hover
              child: Container(
                height: height * 0.28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min, // Added to minimize space
                  children: [
                    if (widget.projectIcon != null)
                      Image.asset(
                        widget.projectIcon!,
                        height: height * 0.04,
                      ),
                    if (widget.projectIconData != null)
                      Icon(
                        widget.projectIconData,
                        color: AppTheme.c!.primary!,
                        size: height * 0.1,
                      ),
                    Text(
                      widget.projectTitle,
                      style: AppText.b2b?.copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      widget.projectDescription,
                      textAlign: TextAlign.center,
                      style: AppText.b2?.copyWith(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// ------------------ OLD ---------------------
// import 'package:flutter/material.dart';
// import 'package:portfolio/configs/configs.dart';
// import 'package:portfolio/constants.dart';
// import 'package:portfolio/provider/app_provider.dart';
// import 'package:provider/provider.dart';

// class ProjectCard extends StatefulWidget {
//   final String? banner;
//   final String? projectLink;
//   final String? projectIcon;
//   final String projectTitle;
//   final String projectDescription;
//   final IconData? projectIconData;

//   const ProjectCard({
//     super.key,
//     this.banner,
//     this.projectIcon,
//     this.projectLink,
//     this.projectIconData,
//     required this.projectTitle,
//     required this.projectDescription,
//   });

//   @override
//   ProjectCardState createState() => ProjectCardState();
// }

// class ProjectCardState extends State<ProjectCard> {
//   bool isHover = false;

//   @override
//   Widget build(BuildContext context) {
//     final appProvider = Provider.of<AppProvider>(context);
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return InkWell(
//       hoverColor: Colors.transparent,
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       onTap: widget.projectLink == null
//           ? () {}
//           : () => openURL(widget.projectLink!),
//       onHover: (isHovering) {
//         setState(() {
//           isHover = isHovering;
//         });
//       },
//       child: Container(
//         margin: Space.h,
//         padding: Space.all(),
//         width: AppDimensions.normalize(150),
//         decoration: BoxDecoration(
//           color: appProvider.isDark ? Colors.grey[200] : Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: (isHover ? Colors.cyanAccent : AppTheme.c!.primary)!
//                   .withAlpha(100),
//               blurRadius: 12.0,
//               offset: const Offset(0.0, 0.0),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (widget.banner != null)
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.network(
//                   widget.banner!,
//                   height: height * 0.2,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             const SizedBox(height: 8),
//             if (widget.projectIcon != null)
//               Image.asset(
//                 widget.projectIcon!,
//                 height: height * 0.05,
//               ),
//             if (widget.projectIconData != null)
//               Icon(
//                 widget.projectIconData,
//                 color: AppTheme.c!.primary!,
//                 size: height * 0.1,
//               ),
//             const SizedBox(height: 8),
//             Text(
//               widget.projectTitle,
//               style: AppText.b2,
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 8),
//             Flexible(
//               child: Wrap(
//                 alignment: WrapAlignment.center,
//                 children: [
//                   Text(
//                     widget.projectDescription,
//                     textAlign: TextAlign.center,
//                     style: AppText.b2?.copyWith(fontSize: 11.0),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }