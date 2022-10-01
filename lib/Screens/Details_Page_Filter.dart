// ignore_for_file: prefer_const_constructors, must_be_immutable, file_names, non_constant_identifier_names, non_constant_identifier_names, duplicate_ignore, prefer_typing_uninitialized_variables, deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel_trucks/Constant.dart';
import '../Controller/Data.dart';
import 'More_Details.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailsPageFilter extends StatelessWidget {
  int index;
  var Id;
  List list;

  DetailsPageFilter({
    Key? key,
    required this.index,
    required this.list,
    required this.Id,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image:
          AssetImage(
              photo),
              fit: BoxFit.cover)
      ),
      child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0)  ,
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
                    text: "${trucksList[Id].truckName}",
                    color: test3,
                    size: 25.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              cardDetails(
                  string: "Recency",
                  number: "${trucksList[Id].recency}"),
              cardDetails(
                  string: "Frequency",
                  number: "${trucksList[Id].frequency}"),
              cardDetails(
                  string: "Monetary",
                  number: "${trucksList[Id].monetary}"),
              SizedBox(
                height: 15.h,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                    onTap: () {
                      navigateTo(MoreDetails(Index: Id
                      ), context);
                    },
                    child: text(
                        color: test3, text: "details..", size: 20.sp)),
              ),
              SizedBox(
                height: 20.h,
              ),
              View(index: Id, align: MainAxisAlignment.center,),

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
                          text: "${trucksList[Id
                          ].score}",
                          color: trucksList[Id
                          ].score! > 50
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
  }
}
