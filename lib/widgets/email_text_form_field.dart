
import 'package:flutter/material.dart';

class CommonWidgets {
 static Widget emailFormField (TextEditingController controller){
  return TextFormField(
     validator: (val){
       if(val!.isEmpty||!val.contains("@")){
         return "Required";
       }
       return null;
     },

     controller: controller,
     keyboardType: TextInputType.emailAddress,
     decoration: const InputDecoration(
         prefixIcon: Icon(Icons.email), hintText: "Email"),
   );
 }



 static Widget passwordFormField (TextEditingController controller){
   return
     TextFormField(

       validator: (val){
         if(val!.isEmpty||val.length<7){
           return "Required";
         }
         return null;
       },


       controller: controller,
       obscureText: true,
       keyboardType: TextInputType.visiblePassword,
       decoration: const InputDecoration(
           prefixIcon: Icon(Icons.lock), hintText: "Password"),
     );
 }


}
