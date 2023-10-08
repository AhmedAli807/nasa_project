import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_project/config/primary_button.dart';
import 'package:nasa_project/config/screen_size.dart';

import 'package:nasa_project/utils/color_assets.dart';
import 'package:nasa_project/views/Login/widgets/password_login.dart';
import 'package:nasa_project/views/home/home_view.dart';
import 'package:provider/provider.dart';

import '../../../controller/authentication/login/login_provider.dart';
import 'don_not_have_account.dart';
import 'email_login.dart';
import 'forgot_password.dart';
import 'google_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> key = GlobalKey();
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: key,
              child: Column(
                children: [
                  ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(16),
                      children: [
                        Lottie.asset('lottie/login.json',
                            controller: _controller,
                            width: ScreenSize.width(context) * 0.5,
                            height: ScreenSize.height(context) * 0.5,
                            onLoaded: (composition) {
                              _controller
                                ..duration = composition.duration
                                ..forward();
                            }),
                        EmailLogin(emailController: emailController),
                        SizedBox(
                          height: ScreenSize.height(context) * 0.02,
                        ),
                        PasswordLogin(passwordController: passwordController),
                        SizedBox(
                          height: ScreenSize.height(context) * 0.02,
                        ),
                        ForgotPassword(emailController: emailController),
                        SizedBox(
                          height: ScreenSize.height(context) * 0.02,
                        ),
                        PrimaryButton(
                            title: 'Login',
                            height: 0.06,
                            width: 0.6,
                            onPressed: () {
                              try {
                                if (key.currentState!.validate() && FirebaseAuth
                                    .instance.currentUser!.emailVerified) {
                                  Provider.of<LoginProvider>(
                                      context, listen: false).loginMethod(
                                      emailAddress: emailController.text,
                                      password: passwordController.text);
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => const HomeView()));
                                }
                                else {
                                  FirebaseAuth.instance.currentUser!
                                      .sendEmailVerification();
                                  AwesomeDialog(context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Success',
                                      desc: 'Check your gmail to verify account',
                                      descTextStyle: TextStyle(
                                          color: ColorAssets.kColor)).show;
                                }
                              }
                              catch (e) {
                                print(e);
                              }
                            },
                            primaryColor: ColorAssets.kColor,
                            secondaryColor: ColorAssets.backgroundColor,
                            fontSize: 17),
                        SizedBox(
                          height: ScreenSize.height(context) * 0.02,
                        ),
                         const GoogleButton(),
                        SizedBox(
                          height: ScreenSize.height(context) * 0.02,
                        ),
                        const DoNotHaveAccount()
                      ]),
                ],
              ),
            ),
          ),
        ));
  }
}





