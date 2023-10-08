
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nasa_project/controller/authentication/login/google_signin_provider.dart';
import 'package:nasa_project/controller/authentication/login/login_provider.dart';
import 'package:nasa_project/controller/authentication/login/reset_password_provider.dart';
import 'package:nasa_project/controller/authentication/login/sign_out_provider.dart';
import 'package:nasa_project/controller/authentication/signup/signup_provider.dart';
import 'package:nasa_project/controller/image_picker/image_picker_provider.dart';
import 'package:nasa_project/controller/maps/factory_map_provider.dart';
import 'package:nasa_project/controller/maps/get_maps_detect_provider.dart';
import 'package:nasa_project/controller/maps/permission_provider.dart';
import 'package:nasa_project/network_services/firebase_options.dart';
import 'package:nasa_project/utils/color_assets.dart';
import 'package:nasa_project/views/Login/login_view.dart';
import 'package:nasa_project/views/Splash/splash_view.dart';
import 'package:nasa_project/views/factory_map/factory_map_view.dart';
import 'package:nasa_project/views/home/home_view.dart';
import 'package:nasa_project/views/map_fire/map_view.dart';
import 'package:nasa_project/views/pick_fire/pick_image_view.dart';
import 'package:nasa_project/views/signup/signup_view.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptionMethod.firebaseOptions());
  runApp(MultiProvider(
    providers: [
      ListenableProvider(create: (context)=>GetFireData()),
      ListenableProvider(create: (context)=>PermissionProvider()),
      ListenableProvider(create: (context)=>LoginProvider()),
      ListenableProvider(create: (context)=>SignupProvider()),
      ListenableProvider(create: (context)=>GoogleSigninProvider()),
      ListenableProvider(create: (context)=>ResetPasswordProvider()),
      ListenableProvider(create: (context)=>PickedImageProvider()),
      ListenableProvider(create: (context)=>FactoryMapProvider()),
      ListenableProvider(create: (context)=>SignOutProvider()),

    ],
      child: const MyApp()));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: ColorAssets.backgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme)
      ),
      home: const HomeView(),
    );
  }
}

