import 'package:chatty_matty/utils/app_imports.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    initializeRoute();
    super.onInit();
  }

  void initializeRoute() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(RouteNames.kHome);
    });
  }
}
