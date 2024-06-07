import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pregnancy_guide/core/services/database_service.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';
import 'package:pregnancy_guide/core/style/app_text_style.dart';
import 'package:pregnancy_guide/core/widgets/custom_button.dart';
import 'package:pregnancy_guide/features/equipment/models/item.dart';
import 'package:pregnancy_guide/features/home/view/main_screen.dart';

class SetDateScreen extends StatefulWidget {
  const SetDateScreen({super.key});

  @override
  State<SetDateScreen> createState() => _SetDateScreenState();
}

class _SetDateScreenState extends State<SetDateScreen> {
  int _selectedValue = 0;
  DateTime fromDate = DateTime.now();

  void selectDate({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fromDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    setState(() {
      fromDate = picked ?? fromDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "الرجاء إختيار احد الخيارين التاليين و من ثم تحديد التاريخ المناسب ",
                    textAlign: TextAlign.right,
                    softWrap: true,
                    style: AppTextStyle.primaryTextStyle
                        .copyWith(color: AppColors.darkColor2, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RadioListTile<int>(
                    title: Text(
                      "سأقوم بإدخال تاريخ اول يوم لآخر دورة شهرية",
                      textAlign: TextAlign.right,
                      softWrap: true,
                      style: AppTextStyle.secondaryTextStyle.copyWith(
                          color: AppColors.subTitleColor, fontSize: 13),
                    ),
                    value: 0,
                    activeColor: AppColors.secondaryColor,
                    groupValue: _selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RadioListTile<int>(
                    title: Text(
                      "سأقوم بإدخال التاريخ المتوقع للولادة كما أخبرني به الطبيب",
                      textAlign: TextAlign.right,
                      softWrap: true,
                      style: AppTextStyle.secondaryTextStyle.copyWith(
                          color: AppColors.subTitleColor, fontSize: 13),
                    ),
                    value: 1,
                    activeColor: AppColors.secondaryColor,
                    groupValue: _selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _datePickerField(),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                      onPressed: () async {
                        DatabaseService databaseService = DatabaseService();

                        if (_selectedValue == 0) {
                          await databaseService.setStringValue(
                              "birth_date",
                              fromDate
                                  .add(const Duration(days: 280))
                                  .toString());
                        } else {
                          await databaseService.setStringValue(
                              "birth_date", fromDate.toString());
                        }
                        await databaseService.setBoolValue("first_time", false);

                        await databaseService.setStringValue(
                            "mom_list", json.encode(momEquipmentToJson));
                        await databaseService.setStringValue(
                            "fetus_list", json.encode(fetusEquipmentToJson));
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MainScreen(),
                          ),
                        );
                      },
                      text: "تم",
                      buttonColor: AppColors.secondaryColor)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _datePickerField() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "التاريخ",
            textAlign: TextAlign.right,
            softWrap: true,
            style: AppTextStyle.secondaryTextStyle
                .copyWith(color: AppColors.subTitleColor, fontSize: 13),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => selectDate(context: context),
            child: IgnorePointer(
              child: TextFormField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.primaryColor,
                    contentPadding: const EdgeInsets.all(10),
                    hintText: "${fromDate.toLocal()}".split(' ')[0],
                    hintStyle: AppTextStyle.primaryTextStyle
                        .copyWith(color: AppColors.darkColor2),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                          BorderSide(width: 2.0, color: AppColors.primaryColor),
                    ),
                    prefixIcon: const Icon(
                      Icons.calendar_today,
                      color: AppColors.darkColor2,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
