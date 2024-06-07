import 'package:flutter/material.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';

class ModelBottomSheetUtils {
  static Future<void> show({required BuildContext context, required child}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
              right: 0,
              left: 0,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(child: child),
        );
      },
    );
  }
}
