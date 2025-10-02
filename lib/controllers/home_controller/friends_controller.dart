import 'package:chatty_matty/utils/app_imports.dart';

class FriendsController extends GetxController {
  RxList<UserModel> friendsList = <UserModel>[].obs;
  var selectedUser = UserModel().obs;

  
}
