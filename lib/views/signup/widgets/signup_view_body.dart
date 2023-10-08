import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_project/controller/authentication/signup/signup_provider.dart';
import 'package:nasa_project/views/Login/login_view.dart';
import 'package:nasa_project/views/signup/widgets/password_field.dart';
import 'package:provider/provider.dart';

import '../../../config/primary_button.dart';
import '../../../config/screen_size.dart';
import '../../../utils/color_assets.dart';
import 'email_field.dart';
import 'full_name_field.dart';
import 'have_account.dart';
import 'phone_field.dart';
import 'pick_country.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({Key? key}) : super(key: key);

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody>
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

  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    CollectionReference userData =
    FirebaseFirestore.instance.collection("user data");
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    GlobalKey<FormState> key = GlobalKey();
    Future<void> addUserData() {
      return userData.add({
        "name": nameController.text,
        "email": emailController.text,
        "phone": phoneController.text,
      });
    }

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
                        Lottie.asset('lottie/signup.json',
                            controller: _controller,
                            width: ScreenSize.width(context) * 0.6,
                            height: ScreenSize.height(context) * 0.6,
                            onLoaded: (composition) {
                              _controller
                                ..duration = composition.duration
                                ..forward();
                            }),
                        FullNameField(nameController: nameController),
                        SizedBox(
                          height: ScreenSize.height(context) * 0.02,
                        ),
                        PhoneField(phoneController: phoneController),
                        SizedBox(
                          height: ScreenSize.height(context) * 0.02,
                        ),
                       const  PickCountry(),
                        SizedBox(
                          height: ScreenSize.height(context) * 0.02,
                        ),
                        EmailSignup(emailController: emailController),
                        SizedBox(
                          height: ScreenSize.height(context) * 0.02,
                        ),
                        PasswordField(passwordController: passwordController),
                        SizedBox(
                          height: ScreenSize.height(context) * 0.02,
                        ),
                        PrimaryButton(
                            title: 'Create Account',
                            height: 0.06,
                            width: 0.6,
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (
                                            context) => const LoginView()));
                                Provider.of<SignupProvider>(context, listen: false)
                                    .signupCreation(
                                    emailAddress: emailController.text,
                                    password: passwordController.text);
                                addUserData();
                                AwesomeDialog(context: context,
                                  dialogType: DialogType.success,
                                  title: 'Success',
                                  desc: 'Please verify your account from your mail'
                                ).show();
                              }
                            },
                            primaryColor: ColorAssets.kColor,
                            secondaryColor: ColorAssets.backgroundColor,
                            fontSize: 17),
                        SizedBox(
                          height: ScreenSize.height(context) * 0.02,
                        ),
                      const Center(child:HaveAccount())
                      ]),
                ],
              ),
            ),
          ),
        ));
  }
}






