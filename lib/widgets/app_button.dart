import 'package:chatty_matty/utils/app_imports.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final String buttonName;
  final Color? textColor;
  final Color? buttonColor;
  final VoidCallback onTap;
  const AppButton({
    super.key,
    this.width,
    required this.buttonName,
    required this.onTap,
    this.textColor,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: MyText(text: buttonName, color: textColor),
        ),
      ),
    );
  }
}
