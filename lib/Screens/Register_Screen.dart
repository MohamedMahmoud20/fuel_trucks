// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_trucks/Constant.dart';
import 'package:fuel_trucks/Cubit/cubit_cubit.dart';
import 'package:fuel_trucks/Cubit/cubit_state.dart';

import 'Home_Page.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController Email = TextEditingController();
    TextEditingController Password = TextEditingController();
    TextEditingController Name = TextEditingController();
    TextEditingController phone = TextEditingController();
    UserCredential User;
    return BlocConsumer<FTMACubit, FTMAStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FTMACubit.get(context);
        return Scaffold(
          body: Form(
            key: cubit.formstateSigUp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textFeild(
                    valid: "Name LessThan 3 Character",
                    control: Name,
                    text: "Name",
                    prefix: Icons.person,
                    keyboardType: TextInputType.name),
                textFeild(
                    valid: "Email LessThan 4 letter",
                    control: Email,
                    text: "Email",
                    prefix: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress),
                textFeild(
                    valid: "Password is LessThan 4 Character",
                    control: Password,
                    text: "Password",
                    prefix: Icons.lock,
                    obscure: cubit.visiability,
                    suffix: cubit.visiability
                        ? Icons.visibility_off
                        : Icons.visibility,
                    onTapPassword: () {
                      cubit.changeEye();
                    }),
                textFeild(
                    valid: "Number is Null",
                    control: phone,
                    text: "phone",
                    prefix: Icons.phone,
                    keyboardType: TextInputType.phone),
                defaultButton(
                    ontap: () async {
                      try {
                        User = await  cubit.signUp(Password: Password.text, Email: Email.text, context: context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Register is Done.",
                            textAlign: TextAlign.center,
                          ),
                        ));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "The password  is too weak.",
                                textAlign: TextAlign.center,
                              )));
                          print('The password  is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "The account already exists for that email.",
                                  textAlign: TextAlign.center)));
                          print('The account already exists for that email.');
                        }

                      } catch (e) {
                        print(e);
                      }                       },
                    text: "Register")
              ],
            ),
          ),
        );
      },
    );
  }
}
