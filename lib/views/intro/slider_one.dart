import 'package:chatty_matty/utils/app_imports.dart';

class SliderOne extends StatelessWidget {
  const SliderOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [
              Image.asset(AppConstants.kSliderOneImage),
              MyText(
                text: '👋 Your Smartest New Chat Buddy',
                size: 25,
                align: TextAlign.center,
                weight: FontWeight.bold,
              ),

              MyText(
                text:
                    'Say hello to Chatty Matty—the app that makes conversations fun, useful, and always available. Whether you need quick answers, friendly company, or a dose of inspiration, Chatty Matty is here to chat with you anytime. No boring moments, no waiting—just instant conversations that fit right into your life.',
                size: 16,
                color: AppColors.kGreyColor,
                align: TextAlign.center,
              ),

              SizedBox(height: 20),
              AppButton(
                buttonName: 'Next',
                onTap: () {
                  Get.toNamed(RouteNames.kSliderTwo);
                },
                textColor: AppColors.kWhiteColor,
                width: Get.width / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
