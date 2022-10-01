// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously, avoid_print

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel_trucks/Cubit/cubit_cubit.dart';
import 'package:fuel_trucks/Cubit/cubit_state.dart';
import 'package:fuel_trucks/Screens/Reset_Password.dart';
import '../Constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  late UserCredential User;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FTMACubit, FTMAStates>(
      listener: (context, state) {},
      builder: (context, value) {
        var cubit = FTMACubit.get(context);
        return Form(
            key: cubit.formstateSigIn,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "lib/images/XLYSK3JS6RMS3FUZS4OWDOFBEU.jpg"),
                      fit: BoxFit.cover)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          "FTMA",
                          style: TextStyle(fontSize: 50.sp, color: test2),
                        )),
                        SizedBox(
                          height: 60.h,
                        ),
                        textFeild(
                            control: Email,
                            text: "Email",
                            prefix: Icons.assignment_ind_outlined,
                            obscure: false,
                            valid: "Email LessThan 4 letter"),
                        textFeild(
                            control: Password,
                            valid: "Password is LessThan 4 Character",
                            text: "Password",
                            suffix: cubit.visiability
                                ? Icons.visibility_off
                                : Icons.visibility,
                            prefix: Icons.password_outlined,
                            obscure: cubit.visiability,
                            onTapPassword: () {
                              cubit.changeEye();
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            defaultButton(
                                ontap: () async {
                                  try {
                                    User = await cubit.signIn(
                                        context: context,
                                        Email: Email.text,
                                        Password: Password.text);

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                      "Sign in is Done.",
                                      textAlign: TextAlign.center,
                                    )));
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                        "No user found for that email.",
                                        textAlign: TextAlign.center,
                                      )));
                                    } else if (e.code == 'wrong-password') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                        "Wrong password provided for that user.",
                                        textAlign: TextAlign.center,
                                      )));
                                    }
                                    var user = FirebaseAuth.instance.currentUser;
                                    User = (FirebaseAuth.instance)
                                        as UserCredential;
                                    print(User.user?.emailVerified == false);
                                    if (User.user?.emailVerified == false) {
                                      await user?.sendEmailVerification();
                                    }
                                  }
                                },
                                text: "Sign in"),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(ResetPassword(), context);
                          },
                          child: Text(
                            "Forget Password ?",
                            style: TextStyle(color: test2),
                          ),
                        )
                      ]),
                ),
              ),
            ));
      },
    );
  }
}
