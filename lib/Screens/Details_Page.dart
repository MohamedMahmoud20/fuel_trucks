// ignore_for_file: prefer_const_constructors, must_be_immutable, file_names, deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel_trucks/Constant.dart';
import 'package:fuel_trucks/Cubit/cubit_cubit.dart';
import 'package:fuel_trucks/Cubit/cubit_state.dart';
import 'package:fuel_trucks/Screens/More_Details.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Controller/Data.dart';
import '../font_style.dart';

class DetailsPage extends StatelessWidget {
  int index;

  DetailsPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FTMACubit, FTMAStates>(
      builder: (BuildContext context, state) {
        return Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(photo), fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 15.0, sigmaX: 15.0),
            child: Scaffold(
              backgroundColor: Colors.black12,
              appBar: AppBar(
                title: text(
                    text: "Analysis", color: primaryColorText, size: 26.sp),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: primaryColorText,
                    )),
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Center(
                      child: text(
                          text: "${trucksList[index].truckName}",
                          color: test3,
                          size: 25.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    cardDetails(
                        string: "Recency",
                        number: "${trucksList[index].recency}"),
                    cardDetails(
                        string: "Frequency",
                        number: "${trucksList[index].frequency}"),
                    cardDetails(
                        string: "Monetary",
                        number: "${trucksList[index].monetary}"),
                    SizedBox(
                      height: 15.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () {
                            navigateTo(MoreDetails(Index: index), context);
                          },
                          child: text(
                              color: test3, text: "details..", size: 20.sp)),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    View(index: index, align: MainAxisAlignment.center,),
                    SizedBox(
                      height: 50.h,
                    ),
                    SizedBox(
                      height: 90.h,
                      width: 280.w,
                      child: Card(
                        elevation: 0.0,
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: primaryColorText, width: 1.2.w),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Row(
                          children: [
                            text(
                                text: "Score",
                                color: test3,
                                size: 25.sp,
                                padding: 20.r,
                                weight: FontWeight.w600),
                            SizedBox(
                              width: 76.w,
                            ),
                            text(
                                text: "${trucksList[index].score}",
                                color: trucksList[index].score! > 50
                                    ? Colors.green
                                    : Colors.red,
                                size: 30.sp,
                                padding: 5.r,
                                weight: FontWeight.w600),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(left:20.r , right: 20.r , top: 160.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: test3,
                                    size: 20.r,
                                  ),
                                  text(
                                      text: " Call: ",
                                      color: test3,
                                      size: 18.sp),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        launch("tel://+201090458434");
                                      },
                                      child: text(
                                          text: "+201090458434",
                                          color: test2,
                                          size: 23.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                                onTap: () {},
                                child: text(
                                    text: "Report",
                                    color: Colors.red,
                                    size: 25.sp)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
