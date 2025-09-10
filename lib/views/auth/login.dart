import 'package:chatty_matty/utils/app_imports.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: 'Login',
                  size: 30,
                  weight: FontWeight.bold,
                  color: AppColors.kBlackColor,
                ),
                MyText(
                  text: 'Please login to your account to continue!',
                  size: 16,
                  color: AppColors.kGreyColor,
                ),

                SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppConstants.kAppCircleBorder,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppConstants.kAppCircleBorder,
                      ),
                      borderSide: BorderSide(color: AppColors.kPrimaryColor),
                    ),
                    hintText: 'Enter Email',
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 20),
                Obx(() {
                  return TextFormField(
                    obscureText: controller.isHidden.value,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.changeVisibility();
                        },
                        icon: Icon(
                          controller.isHidden.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.kAppCircleBorder,
                        ),
                        borderSide: BorderSide(color: AppColors.kPrimaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.kAppCircleBorder,
                        ),
                        borderSide: BorderSide(color: AppColors.kPrimaryColor),
                      ),
                      hintText: 'Enter Password',
                      labelText: 'Password',
                    ),
                  );
                }),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: MyText(
                      text: 'Forgot Passowrd?',
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: AppButton(
                    buttonName: 'Connect',
                    onTap: () {},
                    textColor: AppColors.kWhiteColor,
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.kGreyColor, thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: MyText(text: 'or', color: AppColors.kGreyColor),
                    ),
                    Expanded(
                      child: Divider(color: AppColors.kGreyColor, thickness: 1),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                AppButton(
                  buttonName: 'Login with Google',
                  onTap: () {},
                  buttonImage: AppConstants.kGoogleImage,
                  buttonColor: AppColors.kTransparentColor,
                  borderColor: AppColors.kGreyColor,
                ),
                const SizedBox(height: 20),
                AppButton(
                  buttonName: 'Login with Facebook',
                  onTap: () {},
                  buttonImage: AppConstants.kFbImage,
                  buttonColor: AppColors.kTransparentColor,
                  borderColor: AppColors.kGreyColor,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    MyText(
                      text: 'For more information, please see our ',
                      size: 11,
                    ),
                    InkWell(
                      onTap: () {},
                      child: MyText(
                        text: 'Privacy Policy',
                        weight: FontWeight.bold,
                        size: 11,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
