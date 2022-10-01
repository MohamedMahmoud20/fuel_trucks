// ignore_for_file: prefer_const_constructors, file_names, unused_import, non_constant_identifier_names, must_be_immutable
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel_trucks/Controller/Data.dart';
import 'package:fuel_trucks/Cubit/cubit_state.dart';
import 'package:fuel_trucks/Model/ModelTruck.dart';
import 'package:fuel_trucks/Screens/Details_Page_Filter.dart';
import 'package:fuel_trucks/Screens/Gpa.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Cubit/cubit_cubit.dart';
import 'Screens/Details_Page.dart';

var primaryColor = Color(0xffa3bec9);
var colorBorder = Color(0xff4B5D67);
var primaryColorText = Color(0xff000000);
var blue = Colors.deepPurple;
var test = Colors.deepPurple.withOpacity(0.7);
var test3 = Colors.black;
var test2 = Colors.white;
String photo = "lib/images/1l-image-North-Field-Expansion.jpg";
int min = 300;

Widget defaultButton({required ontap, required text}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 10.0),
    child: MaterialButton(
      height: 40,
      onPressed: ontap,
      color: test,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.white70),
      ),
    ),
  );
}

Widget textFeild(
    {required text,
    keyboardType = TextInputType.text,
    suffix,
    prefix,
    obscure = false,
    onTapPassword,
    valid = "",
    control}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextFormField(
      controller: control,
      validator: (val) {
        if (val!.length < 4) {
          return valid;
        }
        return null;
      },
      style: TextStyle(color: Colors.white70),
      keyboardType: keyboardType,
      obscureText: obscure,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: test2),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: test2),
              borderRadius: BorderRadius.circular(15)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: test),
              borderRadius: BorderRadius.circular(15)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: test2),
              borderRadius: BorderRadius.circular(15)),
          label: Text(
            text,
            style: TextStyle(color: test2),
          ),
          prefixIcon: Icon(prefix, color: test2),
          suffixIcon: IconButton(
            onPressed: onTapPassword,
            icon: Icon(suffix, color: test2),
          )),
    ),
  );
}


class truckList extends StatelessWidget {
  List<dynamic> trucksData;
  int Ind;
   var num;
  truckList({
    required this.trucksData,
    required this.Ind,
    required this.num,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: num,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            width: double.infinity,
            child: Card(
              color: Colors.transparent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  side: BorderSide(width: 1.w, color: Colors.black54)),
              child: Padding(
                padding:
                EdgeInsets.only(top: 15.h, bottom: 15.h, left: 15.w, right: 15.w),
                child: Column(children: [
                  text(
                    text: "${trucksList[index + Ind].truckName}",
                    color: Colors.black,
                    size: 28.sp,),
                  Row(
                    children: [
                      text(text: " region : ", color: test3, size: 20.sp,),
                      text(
                        text: "${trucksList[index + Ind].gov}",
                        color: test3,
                        size: 18.sp,),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      text(text: " score : ", color: test3, size: 20.sp),
                      text(
                        text: "${trucksList[index + Ind].score}",
                        color: trucksList[index + Ind].score! < 50
                            ? Colors.red
                            : Colors.green,
                        size: 20.sp,),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  View(index: index + Ind , align: MainAxisAlignment.start,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            navigateTo(GpsScreen(index: index + Ind,), context);
                          },
                          child: Icon(
                            Icons.location_on,
                            color: Colors.yellowAccent.withOpacity(0.7),
                          )),
                      SizedBox(width: 20.w),
                      InkWell(
                          onTap: () {
                            navigateTo(
                                DetailsPage(index: index + Ind), context);
                          },
                          child: text(
                              color: test3, text: "details..", size: 18.sp))
                    ],
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }

}


Widget cardDetails({string, number}) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      return SizedBox(
        width: double.infinity,
        child: Card(
          color: Colors.transparent,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.2.w, color: primaryColorText),
              borderRadius: BorderRadius.circular(15.r)),
          child: Column(children: [
            Align(
                alignment: Alignment.topLeft,
                child: text(
                    weight: FontWeight.w600,
                    padding: 15.r,
                    size: 25.sp,
                    color: test3,
                    text: string)),
            Align(
                alignment: Alignment.center,
                child: text(
                    weight: FontWeight.w600,
                    padding: 10.0.r,
                    size: 25.sp,
                    color: test3,
                    text: "$number")),
          ]),
        ),
      );
    },
  );
}

navigateTo(page, context) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

navigateAndRemove(page, context) {
  return Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

Widget text({text, size, weight, color, padding = 0.0}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
    child: Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: weight, color: color),
    ),
  );
}


class Rating extends StatelessWidget {

   IconData one , two , three, four , five;
   var align;
   Rating({
     required this.one,
     required this.two,
     required this.three,
     required this.four,
     required this.five,
     required this.align,
   });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: align,
      children: [
        Icon(
          one,
          color: Colors.yellow,
        ),
        Icon(
          two,
          color: Colors.yellow,
        ),
        Icon(
          three,
          color: Colors.yellow,
        ),
        Icon(
          four,
          color: Colors.yellow,
        ),
        Icon(
          five,
          color: Colors.yellow,
        ),
      ],
    );
  }

}

class View extends StatelessWidget {

  int index;
  var align;

  View({
    required this.index,
    required this.align,
  });
  @override
  Widget build(BuildContext context) {
      if (trucksList[index].score == 9.1) {
      return Rating(
          align: align,
          one: Icons.star_half,
          five: Icons.star_border,
          four: Icons.star_border,
          three: Icons.star_border,
          two: Icons.star_border);
    }
    else if (trucksList[index].score == 80) {
      return Rating(
          align: align,

          one: Icons.star,
          five: Icons.star_border,
          four: Icons.star,
          three: Icons.star,
          two: Icons.star);
    }
    else if (trucksList[index].score == 50.6) {
      return Rating(
          align: align,
          one: Icons.star,
          two: Icons.star,
          three: Icons.star_half,
          four: Icons.star_border,
          five: Icons.star_border);
    }
    else if (trucksList[index].score == 20.9) {
      return Rating(
          align: align,

          one: Icons.star,
          two: Icons.star_half,
          three: Icons.star_border,
          four: Icons.star_border,
          five: Icons.star_border);
    }
    else if (trucksList[index].score == 99.9) {
      return Rating(
          align: align,

          one: Icons.star,
          two: Icons.star,
          three: Icons.star,
          four: Icons.star,
          five: Icons.star);
    }
    else if (trucksList[index].score == 80.8) {
      return Rating(
          align: align,

          one: Icons.star,
          five: Icons.star_border,
          four: Icons.star,
          three: Icons.star,
          two: Icons.star);
    }
    else if (trucksList[index].score == 0.0) {
      return Rating(
          align: align,

          one: Icons.star_border,
          five: Icons.star_border,
          four: Icons.star_border,
          three: Icons.star_border,
          two: Icons.star_border);
    }
    else if (trucksList[index].score == 31.8) {
      return Rating(
          align: align,

          one: Icons.star,
          five: Icons.star_border,
          four: Icons.star_border,
          three: Icons.star_border,
          two: Icons.star_half);
    }
    else if (trucksList[index].score == 87.8) {
      return Rating(
          align: align,

          one: Icons.star,
          five: Icons.star_half,
          four: Icons.star,
          three: Icons.star,
          two: Icons.star);
    }
    else if (trucksList[index].score == 9.3) {
      return Rating(
          align: align,

          one: Icons.star_half,
          five: Icons.star_border,
          four: Icons.star_border,
          three: Icons.star_border,
          two: Icons.star_border);
    }
    else if (trucksList[index].score == 76.8) {
      return Rating(
          align: align,

          one: Icons.star,
          five: Icons.star_border,
          four: Icons.star_half,
          three: Icons.star,
          two: Icons.star);
    }
    else if (trucksList[index].score == 46.3) {
      return Rating(
          align: align,

          one: Icons.star,
          five: Icons.star_border,
          four: Icons.star_border,
          three: Icons.star_half,
          two: Icons.star);
    }
    else {
      return Container(
        height: 0.0,
      );
    }
  }
}
