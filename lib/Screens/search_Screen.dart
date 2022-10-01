// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, unrelated_type_equality_checks, sort_child_properties_last, prefer_const_literals_to_create_immutables, file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel_trucks/Screens/Details_Page_Filter.dart';
import '../Constant.dart';
import '../Controller/Data.dart';
import 'Gpa.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List listSearch = [];
  final FocusNode _textFocusNode = FocusNode();
  final TextEditingController search = TextEditingController();

  @override
  void dispose() {
    _textFocusNode.dispose();
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(photo), fit: BoxFit.cover)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15.0, sigmaX: 15.0),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.black12,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: primaryColorText,
                  )),
              bottom: PreferredSize(
                  child: Container(
                    height: 80,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: TextField(
                        controller: search,
                        focusNode: _textFocusNode,
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: test2),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white70),
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
                              "Search",
                              style: TextStyle(color: Colors.white),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white70,
                              size: 20.0,
                            ),
                            suffixIcon: search.text.isEmpty
                                ? Icon(
                                    Icons.add,
                                    size: 1.0,
                                  )
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        listSearch.clear();
                                        search.text = "";
                                      });
                                    },
                                    icon: Icon(Icons.clear, color: test2),
                                  )),
                        onChanged: (value) {
                          setState(() {
                            listSearch = trucksList
                                .where((element) =>
                                    "${element.score}".contains(value))
                                .toList();
                            if (value == "") {
                              listSearch.clear();
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  preferredSize: Size.fromHeight(80.0)),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: search.text.isNotEmpty && listSearch.isEmpty
                ? Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 50,
                          color: Colors.black54,
                        ),
                        Text(
                          "No Result try again",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 20.0),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: search.text == '' ? 0 : listSearch.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        height: 200,
                        width: double.infinity,
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(width: 1, color: Colors.black)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 15, bottom: 15, left: 15, right: 15),
                            child: Column(children: [
                              text(
                                  text: "${listSearch[index].truckName}",
                                  color: primaryColorText,
                                  size: 28.0),
                              Row(
                                children: [
                                  text(
                                      text: " gov : ",
                                      color: primaryColorText,
                                      size: 20.0),
                                  text(
                                      text: "${listSearch[index].gov}",
                                      color: primaryColorText,
                                      size: 18.0),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  text(
                                      text: " score : ",
                                      color: primaryColorText,
                                      size: 20.0),
                                  text(
                                      text: "${listSearch[index].score}",
                                      color: listSearch[index].score! < 50
                                          ? Colors.red
                                          : Colors.green,
                                      size: 20.0),
                                ],
                              ),
                              View(index: listSearch[index].id, align: MainAxisAlignment.start,),

                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        navigateTo(GpsScreen(index: listSearch[index].id), context);
                                      },
                                      child: Icon(
                                        Icons.location_on,
                                        color: Colors.yellowAccent
                                            .withOpacity(0.7),
                                      )),
                                  SizedBox(width: 20.w),
                                  InkWell(
                                      onTap: () {
                                        navigateTo(
                                            DetailsPageFilter(
                                              index: index,
                                              Id: listSearch[index].id,
                                              list: listSearch,
                                            ),
                                            context);
                                      },
                                      child: text(
                                          color: test3,
                                          text: "details..",
                                          size: 18.sp))
                                ],
                              )
                            ]),
                          ),
                        ),
                      );
                    },
                  )),
      ),
    );
  }
}
