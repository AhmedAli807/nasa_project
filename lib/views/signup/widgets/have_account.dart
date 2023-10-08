import 'package:flutter/material.dart';
import 'package:nasa_project/utils/color_assets.dart';

import '../../Login/login_view.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Have already account',
          style: TextStyle(color: ColorAssets.kColor),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (
                        context) => const LoginView()));
          },
          child: Text(
            'Login',
            style: TextStyle(
                color: ColorAssets.secondaryColor),
          ),
        ),
      ],
    );
  }
}
