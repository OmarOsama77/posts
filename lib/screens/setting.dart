import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:posts/widgets/delete_dialog.dart';
import 'package:provider/provider.dart';

import '../providers/authentication_view_model.dart';
import '../providers/bottom_nav_bar_provider.dart';
import '../providers/settings_provider.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  Widget textField(String hintText,TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
    );
  }

  void passwordDialog(Function onClick,BuildContext context,TextEditingController controller2 , TextEditingController controller3) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Change Password"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              textField("New Password",controller2),
              textField("Confirm Password",controller3),
            ],
          ),
          actions: [
            ElevatedButton(onPressed: () {
              onClick();
            }, child: const Text("submit"))
          ],
        ));
  }

  void showDialogg(BuildContext context, String title, String hintText,Function onClick,TextEditingController controller) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: textField(hintText,controller),
          actions: [
            ElevatedButton(onPressed: () {
              onClick();

                    }, child: const Text("Submit"))
          ],
        ));
  }

  Widget settingItem(onPreased(), String t1, String t2,Icon icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t1,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(t2)
          ],
        ),
        IconButton(
            onPressed: () {
              onPreased();
            },
            icon: icon)
      ],
    );
  }




  @override
  Widget build(BuildContext context) {
    TextEditingController firstName = TextEditingController();
    TextEditingController secondName = TextEditingController();
    var obj = Provider.of<NavigationProvider>(context);
    TextEditingController newPass = TextEditingController();
    TextEditingController confPass = TextEditingController();
   var viewModel = Provider.of<SettingViewModel>(context);
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: Text(
                        "Settings",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Consumer<SettingViewModel>(builder: (_,viewModel,__){
                        return CircleAvatar(
                          radius: 35,
                          backgroundImage:MemoryImage(base64Decode(viewModel.user!.imageUrl) as Uint8List ),
                        );
                      }),
                      SizedBox(
                        width: 10,
                      ),

                          Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${viewModel.user!.firstName} ${viewModel.user!.secondName}"),
                            Text(viewModel.user!.email)
                          ],

                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Account Information",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  settingItem((){
                      Navigator.pushNamed(context, "/myPosts");
                  }, "My Profile", "See my posts", Icon(Icons.arrow_forward)),
                  const SizedBox(
                    height: 20,
                  ),
                  settingItem(() {
                    showDialogg(context, "First Name", "Enter your first name",(){
                      viewModel.updataFirstName("firstName", firstName.text);
                },firstName);
                  }, "First Name", "Change your first name",
                      const Icon(Icons.arrow_forward)),
                  const SizedBox(
                    height: 20,
                  ),
                  settingItem(() {
                    showDialogg(context, "Second Name", "Enter your second name",(){
                      viewModel.updataSecondName("secondName", secondName.text);
                },secondName);
                  }, "Second Name", "Change your Second name",
                      const Icon(Icons.arrow_forward)),
                  const SizedBox(
                    height: 20,
                  ),
                  settingItem(() {
                    passwordDialog((){
                      viewModel.changePassword(newPass.text.trim(), confPass.text.trim());
                    },context,newPass,confPass);
                  }, "Password", "Change your password",
                      const Icon(Icons.arrow_forward)),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<AuthenticationViewModel>(builder:(_,viewModel,__){
                    return  settingItem(()async{
                      if(await viewModel.signOut()){
                        Navigator.pushReplacementNamed(context, "/login");
                        obj.currentIndex = 0;
                      }
                    }, "Logout", "Logout from your account",
                        const Icon(Icons.logout));
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Delete Account!",style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("delete your account")

                        ],
                      ),
                      DeleteDialog(
                        "Delete account",
                        "Are you sure you want to delete your account",
                            (){
                            viewModel.deleteAccount(context);
                            viewModel.deleteUserPosts(viewModel.user!.userId.toString());
                        },
                      )

                    ],

                  )
             
                ],
              ),
            ),
          ),
        ));
  }
}