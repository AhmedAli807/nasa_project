import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_project/config/screen_size.dart';
import 'package:nasa_project/utils/color_assets.dart';
import 'package:nasa_project/utils/font_style.dart';

class FirstOnBoardingViewBody extends StatelessWidget {
  const FirstOnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            height: ScreenSize.height(context)*0.7,
            width: ScreenSize.width(context),
            decoration: BoxDecoration(
              color: ColorAssets.secondaryColor,
              borderRadius: BorderRadius.circular(10)
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenSize.height(context)*0.1,
                  ),
                  Center(child: Lottie.asset('lottie/awarness.json')),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'This application educates the world about the dangers of all types of fire and how to deal with it so that no one is harmed and lives are saved.',
                    style: Styles.textStyle16.copyWith(color: ColorAssets.backgroundColor)),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
