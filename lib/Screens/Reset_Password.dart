// ignore_for_file: file_names, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_trucks/Constant.dart';
import 'package:fuel_trucks/Cubit/cubit_cubit.dart';
import 'package:fuel_trucks/Cubit/cubit_state.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email=TextEditingController();

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image:
          AssetImage(
              "lib/images/XLYSK3JS6RMS3FUZS4OWDOFBEU.jpg"),
              fit: BoxFit.cover)
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 10.0,sigmaX: 10.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(elevation: 0.0,backgroundColor: Colors.transparent,),
          body: BlocConsumer<FTMACubit, FTMAStates>(listener: (BuildContext context, state) {},
            builder: (BuildContext context, Object? state) {
            var cubit= FTMACubit.get(context);
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text(color: test2,text: "Reset Password", size: 20.0 , padding: 10.0),
                  textFeild(
                    control: email,
                      text: "Enter Your Email",
                      prefix: Icons.email,
                      valid: "Letter Lesson 4 letter"
                  ),
                  defaultButton(ontap: ()async{
                   await cubit.ResetPassword(email.text , context);
                  }
                      , text: "Send")

                ]);
            },)
        ),
      ),
    );
  }
}
