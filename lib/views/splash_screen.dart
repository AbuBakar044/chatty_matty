
import 'package:chatty_matty/utils/app_imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(backgroundColor: Colors.amber);
  }
}
