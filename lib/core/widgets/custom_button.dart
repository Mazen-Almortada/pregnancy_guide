import 'package:flutter/material.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';
import 'package:pregnancy_guide/core/style/app_text_style.dart';
import 'package:pregnancy_guide/core/utils/mediaquery.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.onPressed,
      this.icon,
      required this.text,
      this.textAndIconColor,
      required this.buttonColor,
      super.key,
      this.disabled = false,
      this.textSize,
      this.buttonHeight,
      this.buttonWidth});
  final void Function()? onPressed;
  final bool disabled;
  final Color buttonColor;
  final String text;
  final Color? textAndIconColor;
  final IconData? icon;
  final double? textSize;
  final double? buttonHeight;
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: buttonWidth ?? MediaQuery.of(context).size.width,
      highlightElevation: disabled ? 0 : null,
      splashColor: disabled ? Colors.transparent : null,
      highlightColor: disabled ? Colors.transparent : null,
      color: buttonColor,
      elevation: disabled ? 0 : 2,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: buttonColor),
          borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: buttonWidth ?? MediaQuery.of(context).size.width,
        height: buttonHeight ?? 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.right,
              softWrap: true,
              style: AppTextStyle.primaryTextStyle.copyWith(
                  color: textAndIconColor ?? AppColors.darkColor2,
                  fontSize: textSize ?? (kWidth(context) <= 300 ? 14 : 18)),
            ),
            const SizedBox(
              width: 15,
            ),
            icon != null
                ? Icon(
                    icon,
                    color: textAndIconColor,
                    size: kWidth(context) <= 300 ? 20 : 24,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
