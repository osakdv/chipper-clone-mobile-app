import 'package:get/get.dart';

class PreformatPage {
  static double sideSpacing = 18;

  static double screenHeight() {
    return Get.height;
  }

  static double screenWidth() {
    return Get.width;
  }

  static double useScreenHeight(pixel) {
    return screenHeight() - (screenHeight() - pixel);
  }

  static double useScreenWidth(pixel) {
    return screenWidth() - (screenWidth() - pixel);
  }

  static final setBorderRadius = PreformatPage.useScreenHeight(6);
}
