import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pregnancy_guide/core/services/database_service.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';
import 'package:pregnancy_guide/core/style/app_text_style.dart';
import 'package:pregnancy_guide/core/utils/date_formater.dart';
import 'package:pregnancy_guide/features/advice/view/advice_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;
  double progressValue = 0;
  double secondaryProgressValue = 0;
  // ignore: sort_constructors_first
  DateTime birthDate = DateTime.now();
  void getBirthDate() async {
    DatabaseService databaseService = DatabaseService();
    var birthDateString = (await databaseService.getStringValue("birth_date") ??
        DateTime.now().toString());
    birthDate = DateTime.parse(birthDateString);

    setState(() {
      arabicDayName = getDayName(birthDate);
      birthDate;
      leftDays = birthDate.difference(DateTime.now()).inDays < 0
          ? 0
          : birthDate.difference(DateTime.now()).inDays;
      days = (280 - leftDays);
      currentValue = (days / 2.8).floorToDouble();
    });
  }

  int days = 0;
  String arabicDayName = "";
  @override
  void initState() {
    getBirthDate();

    _timer = Timer.periodic(const Duration(milliseconds: 50), (Timer timer) {
      setState(() {
        if (currentValue <= 0 || progressValue == currentValue) {
          timer.cancel();
        }
        progressValue++;
      });
    });
    super.initState();
  }

  int leftDays = 0;
  double currentValue = 0;
  int value = 0;
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  double getFetusWeight() {
    if (days / 7 <= 12) {
      return 0.28;
    } else if (days / 7 <= 28) {
      return 0.9;
    } else {
      return 3;
    }
  }

  double getFetusHeight() {
    if (days / 7 <= 12) {
      return 8;
    } else if (days / 7 <= 28) {
      return 35;
    } else {
      return 47;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/fetus.png",
                    height: 170,
                    color: const Color.fromARGB(255, 245, 208, 223),
                  ),
                  SizedBox(
                      height: 230,
                      width: 250,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                          showLabels: false,
                          showTicks: false,
                          axisLineStyle: AxisLineStyle(
                            thickness: 0.1,
                            color: const Color.fromARGB(26, 105, 104, 104),
                            thicknessUnit: GaugeSizeUnit.factor,
                            cornerStyle: CornerStyle.startCurve,
                          ),
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: progressValue,
                                width: 0.1,
                                sizeUnit: GaugeSizeUnit.factor,
                                enableAnimation: true,
                                animationDuration: 100,
                                animationType: AnimationType.linear,
                                cornerStyle: CornerStyle.startCurve,
                                gradient: const SweepGradient(colors: <Color>[
                                  AppColors.secondaryColor,
                                  Color.fromARGB(255, 245, 208, 223)
                                ], stops: <double>[
                                  0.25,
                                  0.75
                                ])),
                            MarkerPointer(
                              markerWidth: 17,
                              markerHeight: 17,
                              value: progressValue,
                              markerType: MarkerType.circle,
                              enableAnimation: true,
                              animationDuration: 100,
                              animationType: AnimationType.linear,
                              color: AppColors.secondaryColor,
                            )
                          ],
                        ),
                      ])),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(" $days يوم",
                    style: AppTextStyle.primaryTextStyle.copyWith(
                      fontSize: 18,
                      color: AppColors.darkColor1,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: Card(
                color: AppColors.secondaryColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.symmetric(horizontal: 18),
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("الوزن",
                                style: AppTextStyle.secondaryTextStyle.copyWith(
                                  fontSize: 15,
                                  color: AppColors.subTitleColor,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text("${getFetusWeight()} كجم ",
                                textDirection: TextDirection.rtl,
                                style: AppTextStyle.primaryTextStyle.copyWith(
                                  fontSize: 15,
                                  color: AppColors.primaryColor,
                                )),
                          ],
                        ),
                        Container(
                            color: AppColors.subTitleColor,
                            width: 2,
                            height: MediaQuery.of(context).size.height),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("الطول",
                                style: AppTextStyle.secondaryTextStyle.copyWith(
                                  fontSize: 15,
                                  color: AppColors.subTitleColor,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(" ${getFetusHeight()} سم  ",
                                style: AppTextStyle.primaryTextStyle.copyWith(
                                  fontSize: 15,
                                  color: AppColors.primaryColor,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                    constraints: const BoxConstraints(minHeight: 130),
                    child: Card(
                      margin: const EdgeInsets.only(left: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: AppColors.subTitleColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "عمر الجنين",
                              style: AppTextStyle.primaryTextStyle.copyWith(
                                  color:
                                      const Color.fromARGB(150, 235, 242, 244),
                                  fontSize: 13),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            DefaultTabController(
                              length: 2,
                              child: Container(
                                height: 25,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(25.0)),
                                child: TabBar(
                                    onTap: (v) {
                                      setState(() {
                                        value = v;
                                      });
                                    },
                                    labelPadding: const EdgeInsets.only(top: 3),
                                    indicator: BoxDecoration(
                                        color: AppColors.secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(25.0)),
                                    labelColor: AppColors.white,
                                    unselectedLabelColor:
                                        AppColors.subTitleColor,
                                    labelStyle: AppTextStyle.secondaryTextStyle,
                                    tabs: const [
                                      Text("بالاسابيع "),
                                      Text("بالاشهر"),
                                    ]),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                value == 0
                                    ? "${(days / 7).floor()} اسابيع"
                                    : "${(days / 30).floor()} اشهر",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.primaryTextStyle.copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    constraints: const BoxConstraints(minHeight: 130),
                    child: Card(
                      margin: const EdgeInsets.only(right: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: AppColors.subTitleColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "التاريخ المتوقع للولادة",
                              style: AppTextStyle.primaryTextStyle.copyWith(
                                  color:
                                      const Color.fromARGB(150, 235, 242, 244),
                                  fontSize: 13),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "${formatDateTime(birthDate)?.split(' ')[0]} $arabicDayName",
                              style: AppTextStyle.primaryTextStyle.copyWith(
                                  color: AppColors.primaryColor, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "تبقى على الولادة $leftDays يوم",
                              textAlign: TextAlign.center,
                              style: AppTextStyle.secondaryTextStyle.copyWith(
                                  color: AppColors.primaryColor, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              margin: const EdgeInsets.all(18),
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onTap: () {
                  int index =
                      (days / 30).floor() == 0 ? 1 : (days / 30).floor();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AdviceScreen(index: index - 1),
                    ),
                  );
                },
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                title: Text("نصائح مهمة في هذة المرحلة ",
                    style: AppTextStyle.primaryTextStyle.copyWith(
                      fontSize: 14,
                      color: AppColors.darkColor1,
                      fontWeight: FontWeight.bold,
                    )),
                trailing: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 245, 208, 223),
                  radius: 20,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    textDirection: TextDirection.rtl,
                    size: 20,
                    color: AppColors.darkColor2,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  customCard(
      {required String imageUrl,
      required String item,
      required String duration}) {
    return SizedBox(
      height: 168,
      width: 150,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/$imageUrl"),
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item,
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(duration)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}







  // Widget days() {
  //   return Container(
  //     height: 55,
  //     padding: const EdgeInsets.all(10),
  //     child: ListView.builder(

  //       itemCount: 10,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (context, index) {
  //         if (index == 0) {
  //           return const SizedBox();
  //         }
  //         return GestureDetector(
  //           child: Container(
  //             margin: const EdgeInsets.only(left: 15),
  //             padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
  //             decoration: BoxDecoration(
  //               color: index == 5
  //                   ? AppColors.secondaryColor.withOpacity(0.2)
  //                   : Colors.white,
  //               borderRadius: BorderRadius.circular(20),
  //               border: Border.all(
  //                 color: index == 5
  //                     ? AppColors.secondaryColor
  //                     : Theme.of(context).primaryColor.withOpacity(0.2),
  //               ),
  //             ),
  //             child: Text(
  //               "$index",
  //               style: AppTextStyle.secondaryTextStyle.copyWith(
  //                   fontSize: index == 5 ? 17 : 15,
  //                   fontWeight: index == 5 ? FontWeight.bold : null),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
