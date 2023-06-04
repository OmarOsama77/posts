import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posts/providers/authentication_view_model.dart';
import 'package:posts/providers/login_view_model.dart';


import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final myKey = GlobalKey<FormState>();
    AuthenticationViewModel authViewModel = AuthenticationViewModel();
    return Scaffold(
        backgroundColor: Colors.white,
      body: Form(
        key: myKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50,),
            child: Column(
              children: [
                Image.asset("images/login3.png",width:300,height: 350,),
               const Padding(
                  padding:   EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text("Login",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 15),
                  child: Center(
                    child:Column(
                      children: [
                        TextFormField(
                          validator: (val){
                            if(val!.isEmpty||!val.contains("@")){
                              return "Required";
                            }
                            return null;
                          },

                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email), hintText: "Email"),
                        ),
                        const SizedBox(height: 25,),
                        TextFormField(

                          validator: (val){
                            if(val!.isEmpty||val.length<7){
                              return "Required";
                            }
                            return null;
                          },


                          controller: password,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock), hintText: "Password"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){

                    }, child: Text("Forgot Passowrd ? "))
                  ],
                ),
                const SizedBox(height: 15,),
                Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 350,
                      child:
                   Consumer<LoginViewModel>(builder: (_,viewModel,__){
                     return ElevatedButton(
                       onPressed: () async{
                         if(myKey.currentState!.validate()){
                           if(await authViewModel.login(email.text.trim(), password.text.trim())){
                            await viewModel.findUserByEmail(email.text.trim());
                            Navigator.pushReplacementNamed(context, "/bottom_navigation_bar");
                           }
                         }else{
                           Fluttertoast.showToast(msg: "Error");
                         }
                       },
                       child: const Text("Login"),
                       style: ButtonStyle(
                           shape: MaterialStateProperty.all(
                               RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(15)))),
                     );
                   },)
                    ),
                    TextButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, "/signup");
                    }, child:const  Text("Register"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}