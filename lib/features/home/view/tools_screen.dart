import 'package:flutter/material.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';
import 'package:pregnancy_guide/core/style/app_text_style.dart';
import 'package:pregnancy_guide/core/utils/mediaquery.dart';
import 'package:pregnancy_guide/features/advice/view/advice_screen.dart';
import 'package:pregnancy_guide/features/equipment/view/equipment_screen.dart';
import 'package:pregnancy_guide/features/home/view/about_us.dart';
import 'package:pregnancy_guide/features/onboarding/view/set_date_screen.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _customCard(context,
                      title: "تعديل التاريخ",
                      icon: Icons.edit_calendar_rounded, onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SetDateScreen(),
                      ),
                    );
                  }, iconColor: AppColors.secondaryColor),
                  _customCard(context, title: "من نحن", onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AboutUs(),
                      ),
                    );
                  },
                      icon: Icons.groups_rounded,
                      iconColor: AppColors.secondaryColor),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _customCard(context,
                      title: "نصائح عامة",
                      icon: Icons.contact_support_rounded, onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AdviceScreen(),
                      ),
                    );
                  }, iconColor: AppColors.secondaryColor),
                  _customCard(context, title: "تجهيزات الولادة", onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EquipmentScreen(),
                      ),
                    );
                  },
                      icon: Icons.child_friendly_sharp,
                      iconColor: AppColors.secondaryColor),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _customCard(BuildContext context,
      {required String title,
      required IconData icon,
      required void Function()? onTap,
      required Color iconColor}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 180,
        width: kWidth(context) < 310 ? 140 : 160,
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Icon(
                    icon,
                    size: 50,
                    color: iconColor,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,
                          textAlign: TextAlign.right,
                          style: AppTextStyle.primaryTextStyle.copyWith(
                            fontSize: 13,
                            color: AppColors.darkColor1,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
