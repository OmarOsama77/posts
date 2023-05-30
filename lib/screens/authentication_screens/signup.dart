import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/models/user.dart';
import 'package:provider/provider.dart';

import '../../providers/authentication_view_model.dart';
import '../../providers/signup_view_model.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  TextEditingController firstName = TextEditingController();
  TextEditingController secondName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  Widget passwordFormField(TextEditingController controller, String hintText) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (val!.isEmpty || val.length < 2) {
          return "Required";
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(hintText: hintText),
    );
  }

  Widget textFormField(String hintText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (val!.isEmpty || val.length < 2) {
          return "Required";
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(hintText: hintText),
    );
  }

  @override
  Widget build(BuildContext context) {
    final myKey = GlobalKey<FormState>();
    AuthenticationViewModel authViewModel = AuthenticationViewModel();
    return Scaffold(
        body: Form(
      key: myKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 45, left: 31, right: 31),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "Register",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ],
              ),
              Consumer<SignupViewModel>(builder: (_, viewModel, __) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      viewModel.getUserPicture();
                    },
                    child:
                        FutureBuilder(builder:(context,snapshoot){
                        return  CircleAvatar(
                            radius: 40,
                              backgroundImage:  AssetImage("images/user.png")
                             );
                        })
                  ),
                );
              }),
              Column(
                children: [
                  textFormField("First Name", firstName),
                  SizedBox(
                    height: 25,
                  ),
                  textFormField("Second Name", secondName),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: email,
                    validator: (val) {
                      if (val!.isEmpty || val.length < 2) {
                        return "Required";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  passwordFormField(password, "Password"),
                  SizedBox(
                    height: 25,
                  ),
                  passwordFormField(confirmPass, "Confirm Password"),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      height: 50,
                      width: 350,
                      child:
                      Consumer<SignupViewModel>(
                        builder: (_, viewModel, __) {
                          return ElevatedButton(
                            onPressed: ()async {

                             if(myKey.currentState!.validate()&&viewModel.isThereImage()&&viewModel.validation(password.text.trim(), confirmPass.text.trim())){
                                if(await authViewModel.register(email.text.trim(), password.text.trim(), firstName.text.trim(), secondName.text.trim())){
                                  print("Account created");
                                  Fluttertoast.showToast(msg: "Account created succesfully");
                                }
                             }else{
                               Fluttertoast.showToast(msg: "Please try again");
                             }
                            },
                            child: const Text("Register"),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)))),
                          );
                        },
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                      child: const Text("Already have an account"))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
