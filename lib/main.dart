// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, await_only_futures

import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel_trucks/Constant.dart';
import 'package:fuel_trucks/Cubit/cubit_cubit.dart';
import 'package:fuel_trucks/Screens/Home_Page.dart';
import 'package:fuel_trucks/Screens/Login_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lottie/lottie.dart';
import 'Cubit/Bloc_observer.dart';
import 'package:device_preview/device_preview.dart';

bool Login = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  var user = await FirebaseAuth.instance.currentUser;
  if (user == null) {
    Login = true;
  } else {
    Login = false;
  }
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FTMACubit()..FireStorage(),
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) => ScreenUtilInit(
          designSize: orientation == Orientation.portrait
              ? const Size(414, 896)
              : const Size(896, 414),
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  scaffoldBackgroundColor: primaryColor.withOpacity(.8)),
              home: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "lib/images/XLYSK3JS6RMS3FUZS4OWDOFBEU.jpg"),
                        fit: BoxFit.cover)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 10.0, sigmaX: 10.0),
                  child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: AnimatedSplashScreen(
                          backgroundColor: Colors.transparent,
                          splashIconSize: 600.r,
                          splash:Center(child:
                          Lottie.asset(
                              height: 200.h,
                              width: double.infinity,
                              'lib/images/new.json',
                              fit: BoxFit.cover),
                          ),
                          nextScreen: Login ? LoginPage() : Homepage())),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
