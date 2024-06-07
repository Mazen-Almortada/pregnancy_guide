import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';
import 'package:pregnancy_guide/core/style/app_text_style.dart';
import 'package:pregnancy_guide/core/utils/model_bottom_sheet.dart';
import 'package:pregnancy_guide/features/equipment/controller/cubit/equipment_cubit.dart';
import 'package:pregnancy_guide/features/equipment/view/add_equipment_screen.dart';

class EquipmentScreen extends StatefulWidget {
  const EquipmentScreen({super.key});

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  @override
  void initState() {
    BlocProvider.of<EquipmentCubit>(context).getCachedItems("mom_list");
    super.initState();
  }

  int value = 0;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
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
        title: Text("تجهيزات الولادة",
            style: AppTextStyle.primaryTextStyle.copyWith(
              fontSize: 20,
              color: AppColors.darkColor1,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(25.0)),
                child: TabBar(
                    labelPadding: const EdgeInsets.only(top: 3),
                    indicator: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(25.0)),
                    labelColor: AppColors.white,
                    unselectedLabelColor: AppColors.subTitleColor,
                    labelStyle: AppTextStyle.secondaryTextStyle,
                    onTap: (v) {
                      setState(() {
                        value = v;
                      });
                      BlocProvider.of<EquipmentCubit>(context).getCachedItems(
                          value == 0 ? "mom_list" : "fetus_list");
                    },
                    tabs: const [
                      Text("الأم"),
                      Text("المولود"),
                    ]),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  itemsBuilder(),
                  itemsBuilder(),
                ],
              ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryColor,
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
        onPressed: () {
          ModelBottomSheetUtils.show(
              context: context,
              child: AddEquipmentScreen(
                box: value == 0 ? "mom_list" : "fetus_list",
              ));
        },
      ),
    );
  }

  BlocBuilder<EquipmentCubit, EquipmentState> itemsBuilder() {
    return BlocBuilder<EquipmentCubit, EquipmentState>(
      builder: (context, state) {
        if (state is ItemsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ItemsLoaded) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    var item = state.items[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        tileColor: const Color.fromARGB(24, 37, 40, 46),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        leading: Checkbox(
                          value: item.isChecked,
                          onChanged: (newValue) {
                            context.read<EquipmentCubit>().checkItem(
                                item..isChecked = newValue ?? false,
                                value == 0 ? "mom_list" : "fetus_list");
                          },
                        ),
                        title: Text(item.title,
                            style: AppTextStyle.primaryTextStyle.copyWith(
                              fontSize: 15,
                              decoration: item.isChecked
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: AppColors.darkColor1,
                              fontWeight: FontWeight.bold,
                            )),
                        subtitle: Text(item.type,
                            style: AppTextStyle.secondaryTextStyle.copyWith(
                              fontSize: 13,
                              decoration: item.isChecked
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: AppColors.subTitleColor,
                              fontWeight: FontWeight.bold,
                            )),
                        trailing: CircleAvatar(
                          backgroundColor: const Color.fromARGB(43, 37, 40, 46),
                          radius: 20,
                          child: GestureDetector(
                            onTap: () {
                              context.read<EquipmentCubit>().deleteItem(
                                  item, value == 0 ? "mom_list" : "fetus_list");
                            },
                            child: const Icon(
                              Icons.delete,
                              textDirection: TextDirection.rtl,
                              size: 20,
                              color: AppColors.redColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is ItemsEmpty) {
          return Center(
            child: Text("القائمة فارغة",
                style: AppTextStyle.primaryTextStyle.copyWith(
                  fontSize: 15,
                  color: AppColors.darkColor1,
                  fontWeight: FontWeight.bold,
                )),
          );
        }

        return const SizedBox();
      },
    );
  }
}
