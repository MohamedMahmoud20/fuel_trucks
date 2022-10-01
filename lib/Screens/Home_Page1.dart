// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, file_names

import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel_trucks/Constant.dart';
import 'package:fuel_trucks/Cubit/cubit_cubit.dart';
import 'package:fuel_trucks/Cubit/cubit_state.dart';
import 'package:fuel_trucks/Screens/Login_Page.dart';
import 'package:fuel_trucks/Screens/search_Screen.dart';

import 'Home_Page.dart';
import 'Home_Page2.dart';
class Homepage1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FTMACubit, FTMAStates>(
        builder: (context, state) {
          var cubit = FTMACubit.get(context);
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(image:
                AssetImage(
                    photo),
                    fit: BoxFit.cover)
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0,sigmaY: 15.0),
              child: Scaffold(
                backgroundColor: Colors.black12,
                  appBar: AppBar(
                    leading: IconButton(onPressed: (){
                      navigateTo(SearchScreen(), context);
                    }, icon: Icon(Icons.search , color: Colors.black,)),
                      actions: [
                        Padding(
                          padding:  EdgeInsets.all(8.r),
                          child: IconButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                navigateAndRemove(LoginPage(), context);
                              },
                              icon: Icon(
                                Icons.login_outlined,
                                color: primaryColorText,
                              )),
                        )
                      ],
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      title: Text(
                        "Trucks List",
                        style: TextStyle(color: Colors.black, fontSize: 28.sp),
                      ),
                      centerTitle: true),
                  body:Column(children: [
                    truckList(

                        trucksData: cubit.trucksData,
                        Ind: 4,
                        num: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween
                      ,children: [
                      MaterialButton(
                        onPressed: () {
                          navigateTo(Homepage(), context);
                        },
                        child: Icon(Icons.arrow_back_ios, size: 30.r),
                        splashColor: test3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r)),
                        height: 30.h,
                      ),
                      MaterialButton(
                        onPressed: () {
                          navigateAndRemove(Homepage2(), context);
                        },
                        child: Icon(Icons.arrow_forward_ios, size: 30.r),
                        splashColor: test3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r)),
                        height: 30.h,
                      )
                    ],)
                  ]),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
