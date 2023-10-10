import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_project/config/screen_size.dart';
import 'package:nasa_project/utils/font_style.dart';

import '../../../../../utils/color_assets.dart';

class SecondOnBoardingViewBody extends StatelessWidget {
  const SecondOnBoardingViewBody({Key? key}) : super(key: key);

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
                  SizedBox(
                    height: ScreenSize.height(context)*0.1,
                  ),
                  Center(child: Lottie.asset('lottie/fire.json',
                  height: ScreenSize.height(context)*0.3,
                  width: ScreenSize.width(context)*0.7)),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'This application can also show you a map of fires occurring around the world from an approved source, which is NASA.',
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
