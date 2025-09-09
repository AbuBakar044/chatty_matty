import 'package:chatty_matty/utils/app_imports.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Stack(
        children: [
          Center(child: Image.asset(AppConstants.kLogoImage, scale: 3)),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                size: 50,
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
