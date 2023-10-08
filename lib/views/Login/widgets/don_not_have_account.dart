import 'package:flutter/material.dart';
import 'package:nasa_project/utils/color_assets.dart';
import 'package:nasa_project/views/signup/signup_view.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?",
          style: TextStyle(
              color: ColorAssets.kColor
          ),),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => const SignUpView()));
          },
          child: Text("Create account",
            style: TextStyle(
                color: ColorAssets.secondaryColor
            ),),
        ),
      ],
    );
  }
}
