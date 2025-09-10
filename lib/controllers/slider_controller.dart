import 'package:chatty_matty/utils/app_imports.dart';

class SliderController extends GetxController {
  Future<void> savePreferences() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.kSliderKey, AppConstants.kSliderKey);
      Get.offAllNamed(RouteNames.kLogin);
    } catch (e) {
      debugPrint('There is an error: $e');
    }
  }
}
