
import 'package:chatty_matty/utils/app_imports.dart';

class SliderTwo extends StatelessWidget {
  const SliderTwo({super.key});

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
              Image.asset(AppConstants.kSliderTwoImage),
              MyText(
                text: '💬 More Than Just a Chat App',
                size: 25,
                align: TextAlign.center,
                weight: FontWeight.bold,
              ),

              MyText(
                text:
                    'Chatty Matty isn’t just about small talk—it’s about making your day smarter and easier. Get instant tips for daily life, learn something new in seconds, or simply relax with light-hearted chats when you need a break. With Matty by your side, you’ll always have a supportive, friendly, and entertaining companion—24/7, right in your pocket.',
                size: 16,
                color: AppColors.kGreyColor,
                align: TextAlign.center,
              ),

              SizedBox(height: 20),
              Row(
                spacing: 20,
                children: [
                  Expanded(
                    child: AppButton(
                      buttonName: 'Previous',
                      onTap: () {},
                      textColor: AppColors.kWhiteColor,
                      buttonColor: AppColors.kRedColor,
                    ),
                  ),
                  Expanded(
                    child: AppButton(
                      buttonName: 'Continue',
                      onTap: () {},
                      textColor: AppColors.kWhiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
