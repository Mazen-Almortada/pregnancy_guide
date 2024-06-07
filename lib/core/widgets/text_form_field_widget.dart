import 'package:flutter/material.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';
import 'package:pregnancy_guide/core/style/app_text_style.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      this.controller,
      this.validator,
      this.onSaved,
      this.onEditingComplete,
      this.keyboardType,
      this.enabled = true,
      this.initialValue,
      required this.hintText,
      this.suffixIcon,
      this.textInputAction});
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final bool enabled;
  final String hintText;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final TextInputType? keyboardType;
  final IconData? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: enabled,
        initialValue: initialValue,
        autofocus: false,
        controller: controller,
        textAlign: TextAlign.right,
        keyboardType: keyboardType ?? TextInputType.name,
        validator: validator,
        onSaved: onSaved,
        onTap: () {
          if (controller != null) {
            if (controller!.selection ==
                TextSelection.fromPosition(
                    TextPosition(offset: controller!.text.length - 1))) {
              controller!.selection = TextSelection.fromPosition(
                  TextPosition(offset: controller!.text.length));
            }
          }
        },
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  color: AppColors.subTitleColor,
                )
              : null,
          hintTextDirection: TextDirection.rtl,
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.subTitleColor)),
          hintStyle: AppTextStyle.secondaryTextStyle.copyWith(
            color: AppColors.subTitleColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
