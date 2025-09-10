import 'package:chatty_matty/utils/app_imports.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    initializeRoute();
    super.onInit();
  }

  void initializeRoute() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      Future.delayed(const Duration(seconds: 3), () {
        if (prefs.containsKey(AppConstants.kSliderKey)) {
          Get.offAllNamed(RouteNames.kLogin);
        } else {
          Get.offAllNamed(RouteNames.kSliderOne);
        }
      });
    } catch (e) {}
  }
}
