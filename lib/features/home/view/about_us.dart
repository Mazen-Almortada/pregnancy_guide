import 'package:flutter/material.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';
import 'package:pregnancy_guide/core/style/app_text_style.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              textDirection: TextDirection.ltr,
              color: AppColors.darkColor2,
            )),
        title: Text("من نحن",
            style: AppTextStyle.primaryTextStyle.copyWith(
              fontSize: 20,
              color: AppColors.darkColor1,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Center(child: Image.asset("assets/images/team.jpeg")),
    );
  }
}
