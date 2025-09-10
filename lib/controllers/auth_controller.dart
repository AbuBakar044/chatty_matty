import 'package:chatty_matty/utils/app_imports.dart';

class AuthController extends GetxController {

  RxBool isHidden = true.obs;

  void changeVisibility(){
    isHidden.value = !isHidden.value;
  }
  
}