import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';
import 'package:pregnancy_guide/features/equipment/controller/cubit/equipment_cubit.dart';
import 'package:pregnancy_guide/features/splash/view/splash_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  String activeDate = "2024-06-05 20:50:54.641700";
  var difference =
      DateTime.now().difference(DateTime.parse(activeDate)).inMinutes;
// 10079
  if (difference >= 0 && difference <= 20079) {
    runApp(const MyApp());
  } else {
    var preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    exit(0);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EquipmentCubit>(
      create: (context) => EquipmentCubit(),
      child: MaterialApp(
          title: "تنظيم حملي",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            // ignore: deprecated_member_use
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('ar'), Locale('en')],
          locale: const Locale('ar'),
          home: const SplashScreen()),
    );
  }
}
