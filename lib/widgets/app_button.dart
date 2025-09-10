import 'package:chatty_matty/utils/app_imports.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final String buttonName;
  final Color? textColor;
  final Color? buttonColor;
  final Color? borderColor;
  final String? buttonImage;
  final VoidCallback onTap;
  const AppButton({
    super.key,
    this.width,
    required this.buttonName,
    required this.onTap,
    this.textColor,
    this.buttonColor,
    this.borderColor,
    this.buttonImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(AppConstants.kAppCircleBorder),
          border: BoxBorder.all(
            color: borderColor ?? AppColors.kTransparentColor,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buttonImage != null
                  ? Image.asset(buttonImage ?? '', height: 20, width: 20)
                  : const SizedBox.shrink(),
              buttonImage != null
                  ? const SizedBox(width: 20)
                  : const SizedBox.shrink(),
              MyText(text: buttonName, color: textColor),
            ],
          ),
        ),
      ),
    );
  }
}
