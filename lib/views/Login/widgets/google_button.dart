import 'package:flutter/material.dart';
import 'package:nasa_project/config/assets_data.dart';
import 'package:nasa_project/controller/authentication/login/google_signin_provider.dart';
import 'package:provider/provider.dart';

import '../../../config/screen_size.dart';
import '../../../utils/color_assets.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: () {
      Provider.of<GoogleSigninProvider>(
          context, listen: false).signInWithGoogle();
    },
      child: Container(
        height: ScreenSize.height(context) * 0.06,
        width: ScreenSize.width(context) * 0.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorAssets.kColor)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsData.google,
              width: ScreenSize.width(context) * 0.05,),
            SizedBox(
              width: ScreenSize.width(context) * 0.01,
            ),
            const Text('SignIn with google')
          ],
        ),
      )
      ,);
  }
}
