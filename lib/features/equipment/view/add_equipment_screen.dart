import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';
import 'package:pregnancy_guide/core/style/app_text_style.dart';
import 'package:pregnancy_guide/core/widgets/custom_button.dart';
import 'package:pregnancy_guide/core/widgets/text_form_field_widget.dart';
import 'package:pregnancy_guide/features/equipment/controller/cubit/equipment_cubit.dart';
import 'package:pregnancy_guide/features/equipment/models/item.dart';

class AddEquipmentScreen extends StatefulWidget {
  const AddEquipmentScreen({super.key, required this.box});
  final String box;
  @override
  State<AddEquipmentScreen> createState() => _AddEquipmentScreenState();
}

class _AddEquipmentScreenState extends State<AddEquipmentScreen> {
  int _selectedValue = 0;
  TextEditingController textEditingController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: TextFormFieldWidget(
            controller: textEditingController,
            hintText: "إضافة عنصر جديد",
          ),
        ),
        Row(
          textDirection: TextDirection.ltr,
          children: [
            Expanded(
              flex: 1,
              child: RadioListTile<int>(
                visualDensity: VisualDensity.compact,
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                title: Text(
                  "قبل الولادة",
                  textAlign: TextAlign.right,
                  softWrap: true,
                  style: AppTextStyle.secondaryTextStyle
                      .copyWith(color: AppColors.subTitleColor, fontSize: 13),
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
            ),
            Expanded(
              flex: 1,
              child: RadioListTile<int>(
                visualDensity: VisualDensity.compact,
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                title: Text(
                  "بعد الولادة",
                  textAlign: TextAlign.right,
                  softWrap: true,
                  style: AppTextStyle.secondaryTextStyle
                      .copyWith(color: AppColors.subTitleColor, fontSize: 13),
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
            ),
            Expanded(
              flex: 1,
              child: RadioListTile<int>(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                title: Text(
                  "مغادرة المستشفى",
                  textAlign: TextAlign.right,
                  softWrap: true,
                  style: AppTextStyle.secondaryTextStyle
                      .copyWith(color: AppColors.subTitleColor, fontSize: 13),
                ),
                value: 2,
                activeColor: AppColors.secondaryColor,
                groupValue: _selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomButton(
              onPressed: () async {
                String type = "مغادرة المستشفى";
                if (_selectedValue == 0) {
                  type = "قبل الولادة";
                } else if (_selectedValue == 1) {
                  type = "بعد الولادة";
                }

                Item item = Item(title: textEditingController.text, type: type);
                BlocProvider.of<EquipmentCubit>(context)
                    .addItem(item, widget.box);
                Navigator.of(context).pop();
              },
              text: "حفظ",
              buttonColor: AppColors.secondaryColor),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
