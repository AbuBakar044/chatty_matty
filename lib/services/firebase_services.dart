import 'package:chatty_matty/models/user_model.dart';
import 'package:chatty_matty/utils/app_imports.dart';

class FirebaseServices {
  static var fireStoreDB = FirebaseFirestore.instance;
  static var firebaseAuth = FirebaseAuth.instance;
  static Future<bool> createUserAccount(
    String name,
    String email,
    String pass,
  ) async {
    try {
      var user = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      if (user.user != null) {
        await _storeUserData(user.user!.uid, name, email, pass);
      }

      AppConstants.kSuccessSnackBar(
        'Congratulations! $name\nWelcome to Chatty Matty!',
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        AppConstants.kErrorSnackBar(
          'Email is already in use. Choose different one!',
        );
      } else if (e.code == 'weak-password') {
        AppConstants.kErrorSnackBar(
          'Passowrd must be atleast 6 character. Choose a stronge one!',
        );
      } else if (e.code == 'invalid-email') {
        AppConstants.kErrorSnackBar(
          'Email is invalid. Choose a correct email!',
        );
      } else {
        AppConstants.kErrorSnackBar(e.toString());
        debugPrint('..... this is the error: ${e.toString()}');
      }

      return false;
    }
  }

  static Future<bool> loginUser(String email, String pass) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      AppConstants.kSuccessSnackBar('Hi! Welcome back to Chatty Matty!');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppConstants.kErrorSnackBar(
          'User not found. If you do not have any account. Please signup!',
        );
      } else if (e.code == 'wrong-password') {
        AppConstants.kErrorSnackBar('Please add a correct password!');
      } else if (e.code == 'user-disabled') {
        AppConstants.kErrorSnackBar(
          'This account is disabled. Please contact admin!',
        );
      } else if (e.code == 'invalid-email') {
        AppConstants.kErrorSnackBar(
          'Email is invalid. Choose a correct email!',
        );
      } else {
        AppConstants.kErrorSnackBar(e.toString());
        debugPrint('............ this is error: ${e.toString()}');
      }
      return false;
    }
  }

  static Future<void> _storeUserData(
    String userId,
    String name,
    String email,
    String pass,
  ) async {
    try {
      UserModel userModel = UserModel(
        userId: userId,
        name: name,
        email: email,
        password: pass,
        date: DateTime.now().toIso8601String(),
        isOnline: true,
      );
      await fireStoreDB
          .collection(AppConstants.kUserCollection)
          .doc(userId)
          .set(userModel.toJson());
    } on FirebaseException catch (e) {
      AppConstants.kErrorSnackBar(e.toString());
    }
  }
}
