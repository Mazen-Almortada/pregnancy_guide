import 'package:flutter/material.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';
import 'package:pregnancy_guide/core/style/app_text_style.dart';
import 'package:pregnancy_guide/features/onboarding/view/set_date_screen.dart';

import '../models/onboarding_class.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          contents[i].image,
                          height: 220,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(contents[i].title,
                            style: AppTextStyle.primaryTextStyle.copyWith(
                              fontSize: 20,
                              color: AppColors.darkColor1,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 40),
                        Text(contents[i].discription,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.secondaryTextStyle.copyWith(
                                fontSize: 17, color: AppColors.subTitleColor))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.fromLTRB(40, 20, 40, 40),
            width: double.infinity,
            child: MaterialButton(
              onPressed: () async {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SetDateScreen(),
                    ),
                  );
                }
                _controller.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              },
              color: AppColors.secondaryColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                currentIndex == contents.length - 1 ? "ابداء" : "التالي",
                style: AppTextStyle.primaryTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.secondaryColor,
      ),
    );
  }
}
