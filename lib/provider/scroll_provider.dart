import 'package:flutter/cupertino.dart';
import 'package:portfolio/configs/app_dimensions.dart';

class ScrollProvider extends ChangeNotifier {
  final scrollController = ScrollController();

  ScrollController get controller => scrollController;

  scroll(int index) {
    double offset = index == 1
        ? 278
        : index == 2
            ? 263
            : index == 3
                ? 253
                : 248;
    controller.animateTo(
      AppDimensions.normalize(
        offset * index.toDouble(),
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  scrollMobile(int index) {
    double offset = index == 1
        ? 250
        : index == 2
            ? 320
            : index == 3
                ? 260
                : 270;
    controller.animateTo(
      AppDimensions.normalize(
        offset * index.toDouble(),
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
