import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nasa_project/config/assets_data.dart';
import 'package:nasa_project/config/screen_size.dart';
import 'package:nasa_project/utils/color_assets.dart';
import 'package:nasa_project/views/Login/login_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginView())));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: ScreenSize.height(context)*0.5,
              width: ScreenSize.width(context),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AssetsData.logo))
              ),
            ),
          ),
          SizedBox(
            height: ScreenSize.height(context)*0.02,
          ),
          Text('Welcome to Anti Fire',style: TextStyle(
            color: ColorAssets.kColor
          ),)
        ],
      ),
    ));
  }
}
