import 'package:flutter/cupertino.dart';
import 'package:portfolio/configs/app_dimensions.dart';

class ScrollProvider extends ChangeNotifier {
  final scrollController = ScrollController();

  ScrollController get controller => scrollController;

  scroll(int index) {
    double offset = index == 1
        ? 270
        : index == 2
            ? 250
            : index == 3
                ? 247
                : index == 4
                  ? 248
                  : 235;
    controller.animateTo(
      AppDimensions.normalize(
        offset * index.toDouble(),
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

   scrollMobile(int index) {
    // Get the height of the viewport (mobile screen height)
    double screenHeight = scrollController.position.viewportDimension;

    // Adjust offsets based on screen height for all 6 pages
    double offset = index == 0
        ? 0.0 * screenHeight
        : index == 1
            ? 0.37 * screenHeight
            : index == 2
                ? 0.68 * screenHeight
                : index == 3
                    ? 0.92 * screenHeight
                    : index == 4
                        ? 1.16 * screenHeight
                        : 1.32 * screenHeight; // For index 5

    controller.animateTo(
      AppDimensions.normalize(offset),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}

//----OLD----
//   scrollMobile(int index) {
//     double offset = index == 1
//         ? 250
//         : index == 2
//             ? 320
//             : index == 3
//                 ? 260
//                 : index == 4
//                   ? 250
//                   : 270;
//     controller.animateTo(
//       AppDimensions.normalize(
//         offset * index.toDouble(),
//       ),
//       duration: const Duration(seconds: 1),
//       curve: Curves.easeInOut,
//     );
//   }
// }
