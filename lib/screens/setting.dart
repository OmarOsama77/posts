import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/settings_provider.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);
  Widget textField(String hintText){
    return TextFormField(
        decoration: InputDecoration(
         hintText: hintText
        ),
    );
  }
    void passwordDialog (BuildContext context){
        showDialog(context: context, builder: (context)=>AlertDialog(
            title: Text("Change Password"),
            content: Column(mainAxisSize: MainAxisSize.min,
              children: [
                  textField("Old Password"),
                    textField("New Password"),
                    textField("Confirm Password"),
              ],
            ),
            actions: [
              ElevatedButton(onPressed: (){}, child: Text("submit"))
            ],
        ));
    }   
      void showDialogg (BuildContext context,String title, String hintText){
           showDialog(context: context, builder: (context)=>AlertDialog(
              title: Text(title),
              content:  textField(hintText),
              actions: [
                ElevatedButton(onPressed: (){}, child: Text("Submit"))
              ],
    ));
      }
      Widget settingItem(onPreased(),String t1, String t2,Icon icon){
        return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                 Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t1,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        Text(t2)
                      ],
                    ),
                    IconButton(onPressed: (){
                        onPreased();
                    }, icon: icon)
                  ],
          
        );
      }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final data = Provider.of<SettingViewModel>(context);
    return Scaffold(
      body:   SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 50,left: 25,right: 25),
            width: double.infinity,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("Settings",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                SizedBox(height: 12,),
                Row(
                  children: [
                    CircleAvatar(radius: 35,backgroundImage: AssetImage("images/ronaldo.jpg"),),
                    SizedBox(width: 10,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Cristiano Ronaldo"),
                        
                        Text("CR7@RealMadrid.com")
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Text("Account Information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(height: 20,),
                settingItem((){
                  showDialogg(context,"First Name","Enter your first name");
                }, "First Name", "Change your first name",Icon(Icons.arrow_forward)),
                SizedBox(height: 20,),
                 
              settingItem((){
                showDialogg(context,"Second Name","Enter your second name");
              }, "Second Name", "Change your Second name",Icon(Icons.arrow_forward)),     
                SizedBox(height: 20,),
              settingItem(() {
                passwordDialog(context);
              }, "Password", "Change your password",Icon(Icons.arrow_forward)),
               SizedBox(height: 20,),
              settingItem(() => null, "Logout", "Logout from your account",Icon(Icons.logout)),
                SizedBox(height: 20,),
                settingItem((){
                  showDialog(context: context, builder: (context)=>AlertDialog(
                      title: Text("Delete account"),
                      content: Column(mainAxisSize: MainAxisSize.min,
                        children: [
                            Text("Are you sure you want to delete your account"),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(onPressed: (){}, child: Text("Cancel")
                                ),
                                ElevatedButton(onPressed: (){}, child: Text("Yes"),style:ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red
                                ) ,)
                              ],
                            )
                        ],
                      ),
                  ));
                }, "Delete account !", "Delete your account ",Icon(Icons.delete)),
              ],
            ),
          ),
        ),
      )
        
    );
  }
}
