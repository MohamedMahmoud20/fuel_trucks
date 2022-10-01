// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fuel_trucks/Constant.dart';
import 'package:fuel_trucks/Controller/Frequency.dart';
import 'package:fuel_trucks/Controller/Monetary.dart';

class MoreDetails extends StatelessWidget {
int Index;

MoreDetails({Key? key,
  required this.Index,
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
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Scaffold(
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
          elevation: 0.0,
          backgroundColor: Colors.transparent
          ,centerTitle: true , title: Text("Details" , style: TextStyle(fontSize: 26.0,color: primaryColorText),),),
        body: Center(child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Table(
            columnWidths: {
              3:frequencyData[Index].date3==null? FlexColumnWidth(0.001):FlexColumnWidth(1),
              2:frequencyData[Index].date2==null? FlexColumnWidth(0.001):FlexColumnWidth(1),
              1:frequencyData[Index].date1==null? FlexColumnWidth(0.001):FlexColumnWidth(1),

            },
              border: TableBorder.all(color: Colors.black , width: 1),
              children: [
                TableRow(
                    children: [
                      CreateTable(dates: "Dates", style: FontWeight.bold),
                      CreateTable(dates:frequencyData[Index].date1),
                      CreateTable(dates:frequencyData[Index].date2),
                      CreateTable(dates:frequencyData[Index].date3),
                    ]),
                monetaryData[Index].letter2!=null||monetaryData[Index].letter1!=null? TableRow(
                    children: [
                      CreateTable(dates:"Monetary" , style: FontWeight.bold),
                      CreateTable(dates:monetaryData[Index].letter1),
                      CreateTable(dates:monetaryData[Index].letter2),
                      CreateTable(dates:monetaryData[Index].letter3),
                    ]): TableRow(children: [Text(""), Text(""),Text(""),Text("56655656")]),
                monetaryData[Index].letter2!=null||monetaryData[Index].letter1!=null? TableRow(
                    children: [
                      CreateTable(dates:"Fuel type" , style: FontWeight.bold),
                      CreateTable(dates:monetaryData[Index].type1),
                      CreateTable(dates:monetaryData[Index].type2),
                      CreateTable(dates:monetaryData[Index].type3),
                    ]): TableRow(children: [Text(""), Text(""),Text(""),Text("56655656")]),
                monetaryData[Index].letter2!=null||monetaryData[Index].letter1!=null? TableRow(
                    children: [
                      CreateTable(dates:"Place" , style: FontWeight.bold),
                      CreateTable(dates:monetaryData[Index].place1),
                      CreateTable(dates:monetaryData[Index].place2),
                      CreateTable(dates:monetaryData[Index].place3),
                    ]): TableRow(children: [Text(""), Text(""),Text(""),Text("56655656")]),


              ]),
        ),),
        ),
      ),
    );
  }
  CreateTable({dates , style}){
    return  Center(child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(dates ?? "" , style: TextStyle(fontSize: 14.0 , fontWeight: style),),
    ));

  }
}
