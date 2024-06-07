import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';
import 'package:pregnancy_guide/core/style/app_text_style.dart';
import 'package:pregnancy_guide/features/home/view/main_screen.dart';
import 'package:pregnancy_guide/features/onboarding/view/onboarding_screen.dart';
import 'package:pregnancy_guide/features/splash/controller/cubit/splash_cubit.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit()..checkFirstTimeUse(),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return SplashScreenView(
            navigateRoute: (state is FirstTimeOpenApp)
                ? const OnbordingScreen()
                : (state is NotFirstTime)
                    ? const MainScreen()
                    : const SizedBox(),
            duration: 4000,
            speed: 70,
            imageSize: 130,
            imageSrc: "assets/images/logo.png",
            text: "تنظيم حملي",
            textType: TextType.TyperAnimatedText,
            textStyle: AppTextStyle.primaryTextStyle
                .copyWith(color: AppColors.primaryColor, fontSize: 20),
            backgroundColor: AppColors.secondaryColor,
          );
        },
      ),
    );
  }
}
