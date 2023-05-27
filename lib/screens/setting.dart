import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/authentication_view_model.dart';
import '../providers/settings_provider.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  Widget textField(String hintText) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
    );
  }

  void passwordDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Change Password"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  textField("Old Password"),
                  textField("New Password"),
                  textField("Confirm Password"),
                ],
              ),
              actions: [
                ElevatedButton(onPressed: () {}, child: const Text("submit"))
              ],
            ));
  }

  void showDialogg(BuildContext context, String title, String hintText) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: textField(hintText),
              actions: [
                ElevatedButton(onPressed: () {}, child: const Text("Submit"))
              ],
            ));
  }

  Widget settingItem(onPreased(), String t1, String t2, Icon icon) {
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
    final data = Provider.of<SettingViewModel>(context);
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
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("images/ronaldo.jpg"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Consumer<AuthenticationViewModel>(builder:(_,viewModel,__){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(viewModel.currentUser!.displayName.toString()),
                        Text(viewModel.currentUser!.email.toString())
                      ],
                    );
                  })
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
              settingItem(() {
                showDialogg(context, "First Name", "Enter your first name");
              }, "First Name", "Change your first name",
                  const Icon(Icons.arrow_forward)),
              const SizedBox(
                height: 20,
              ),
              settingItem(() {
                showDialogg(context, "Second Name", "Enter your second name");
              }, "Second Name", "Change your Second name",
                  const Icon(Icons.arrow_forward)),
              const SizedBox(
                height: 20,
              ),
              settingItem(() {
                passwordDialog(context);
              }, "Password", "Change your password",
                  const Icon(Icons.arrow_forward)),
              const SizedBox(
                height: 20,
              ),
              settingItem(() => null, "Logout", "Logout from your account",
                  const Icon(Icons.logout)),
              const SizedBox(
                height: 20,
              ),
              settingItem(() {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Delete account"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                  "Are you sure you want to delete your account"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Cancel")),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Yes"),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                  )
                                ],
                              )
                            ],
                          ),
                        ));
              }, "Delete account !", "Delete your account ",
                  const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    ));
  }
}
