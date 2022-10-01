// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_trucks/Controller/Data.dart';
import 'package:fuel_trucks/Model/ModelTruck.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constant.dart';
import '../Screens/Home_Page.dart';
import 'cubit_state.dart';

class FTMACubit extends Cubit<FTMAStates> {
  FTMACubit() : super(InitialState());

  static FTMACubit get(context) => BlocProvider.of(context);

  bool visiability = false;
  GlobalKey<FormState> formstateSigIn = GlobalKey();
  GlobalKey<FormState> formstateSigUp = GlobalKey();
  List<TrucksModel> trucksData = [];
  num? recenc;

  void changeEye() {
    visiability = !visiability;
    emit(ChangeEye());
  }

  signIn({Email, Password, context}) async {
    emit(LoginLoading());
    if (formstateSigIn.currentState!.validate()) {
      print("111111111111111111");
      UserCredential User = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: Email, password: Password);
      print("8888888888888888888");
      if (User.user!.displayName == null) {
        print("222222222222222");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Sign in Successful"),
          duration: Duration(milliseconds: 800),
        ));
        print("3333333333333333");
        navigateAndRemove(Homepage(), context);
        emit(LoginSuccess());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Something is Wrong"),
          duration: Duration(milliseconds: 800),
        ));
        emit(LoginError());

      }
    } else {
      return "NotValid";
    }
  }

  // signUp({Email, Password, context}) async {
  //   if (formstateSigUp.currentState!.validate()) {
  //     UserCredential User = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: Email, password: Password);
  //     if (User.user!.displayName == null) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text("doneRegister"),
  //         duration: Duration(milliseconds: 800),
  //       ));
  //       navigateAndRemove(Homepage(), context);
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Something is Wrong"),
  //       duration: Duration(milliseconds: 800),
  //     ));
  //   }
  // }

  ResetPassword(email, context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(SendMessageSuccess());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 800),
          backgroundColor: Colors.green,
          content: Row(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text("Sent Message Please check Your Gmail")
            ],
          )));
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: test,
              content: Text(
                e.message.toString(),
                style: TextStyle(color: test2),
              ),
            );
          });
    }
  }

  FireStorage() async {
    for (var element in trucksList) {
      trucksData.add(element);
    }
    emit(TrucksDataSuccess());
  }

  saveData({required var key, required var value}) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
    print("===========Done===========");
    emit(SaveDataSuccess());
  }

  Future reedData({required String key}) async {
    var prefs = await SharedPreferences.getInstance();
    var data=prefs.getInt(key.toString());
    emit(ReadDataSuccess());
    return data;
  }


  // recency(index) async {
  //   Timer.periodic(Duration(seconds: 6), (timer) {
  //     var Final = trucksList[index].recency++;
  //     saveData(key: "$index", value: Final);
  //     reedData(key: "$index");
  //     emit(IncreaseSuccess());
  //     recenc=Final;
  //     print("Value = = = = ${recenc}");
  //   });
  // }
}