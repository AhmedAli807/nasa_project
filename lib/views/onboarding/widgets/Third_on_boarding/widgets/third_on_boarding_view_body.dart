import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_project/config/screen_size.dart';

import '../../../../../utils/color_assets.dart';
import '../../../../../utils/font_style.dart';

class ThirdOnBoardingViewBody extends StatelessWidget {
  const ThirdOnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:  Padding(
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

                  Center(child: Lottie.asset('lottie/factory.json')),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'This application also shows you a map of the factories that work in waste recycling so that the waste owners sell the waste to the factories so that they are not disposed of by burning and causing a lot of damage to the environment, but dealing with the factories during the sales stage is outside the application’s responsibility.',
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
