import 'package:chatty_matty/utils/app_imports.dart';

class AuthController extends GetxController {
  var nameCtrl = TextEditingController();
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  var signupFormKey = GlobalKey<FormState>();

  RxBool isHidden = true.obs;

  void changeVisibility() {
    isHidden.value = !isHidden.value;
  }

  Future<void> registerUserWithFirebase() async {
    AppConstants.showLoading();
    await FirebaseServices.createUserAccount(
      nameCtrl.text,
      emailCtrl.text,
      passwordCtrl.text,
    ).then((val) {
      if (val) {
        nameCtrl.clear();
        emailCtrl.clear();
        passwordCtrl.clear();
      }
    });

    AppConstants.hideLoading();
  }
}
