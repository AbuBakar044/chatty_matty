import 'package:chatty_matty/utils/app_imports.dart';

class AppConstants {
  //Images Constants
  static String kSliderOneImage = 'assets/images/slider_one.webp';
  static String kSliderTwoImage = 'assets/images/slider_two.webp';
  static String kLogoImage = 'assets/images/logo.png';
  static String kFbImage = 'assets/images/fb.png';
  static String kGoogleImage = 'assets/images/google.png';

  //Preference Key
  static String kSliderKey = 'slider';
  static String kAppName = 'Chatty Matty';


  //Firebase constants

  static String kUserCollection = 'users';

  static double kAppCircleBorder = 15;

  static void kErrorSnackBar(String text) {
    Get.snackbar(
      kAppName,
      text,
      backgroundColor: AppColors.kRedColor,
      colorText: AppColors.kWhiteColor,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void kSuccessSnackBar(String text) {
    Get.snackbar(
      kAppName,
      text,
      backgroundColor: AppColors.kGreenColor,
      colorText: AppColors.kWhiteColor,
    );
  }

  static String? commonValidator(String? value) {
    if (value != null && value.isEmpty) {
      return '*please fill all the fields';
    } else {
      return null;
    }
  }

  static void showLoading() {
    EasyLoading.show(status: 'Please wait...');
  }

  static void hideLoading() {
    EasyLoading.dismiss();
  }
}
