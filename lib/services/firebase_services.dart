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
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

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
        AppConstants.kErrorSnackBar('Passowrd must be atleast 6 character. Choose a stronge one!');
      } else if (e.code == 'invalid-email') {
        AppConstants.kErrorSnackBar(
          'Email is invalid. Choose a correct email!',
        );
      } else {
        AppConstants.kErrorSnackBar('Sanu nai pta ki hoya a!');
      }

      return false;
    }
  }
}
