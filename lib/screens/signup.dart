import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/register_view_model.dart';

class Signup extends StatelessWidget {
    Signup({Key? key}) : super(key: key);
  TextEditingController password = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final myKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: myKey,
            child:Container(
              padding: const EdgeInsets.only(top: 20,right: 20,left:20),
             width: double.infinity,
              child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/register.png"))
                      ),
                    ),
                  ),
                  Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "First Name"
                    ),
                    validator: (val){
                      if(val!.isEmpty||val.length<2){
                        return "Required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    validator: (val){
                      if(val!.isEmpty||val.length<2){
                        return "Required";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Second Name"
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    validator: (val){
                      if(val!.isEmpty||!val.contains('@')||val.length<=5){
                        return "Required";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email"
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    validator: (val){
                      if(val!.isEmpty||val.length<=7){
                        return "Required";
                      }
                      return null;
                    },
                    obscureText: false,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: "Password"
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    validator: (val){
                      if(val!.isEmpty||val.length<=7){
                        return "Required";
                      }
                      return null;
                    },
                    obscureText: false,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: "Confirm Password"
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(width: double.infinity,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 350,
                          child: Consumer<RegisterViewModel>(
                              builder: (_,viewModel, __){
                            return ElevatedButton(onPressed: (){
                                 if(viewModel.checkPasswordVal(password.text, confirmPass.text)){
                                   print("Succes");
                                 }else{
                                   print("Error");
                                 }
                            }, child: const Text("Register"),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  ))
                              ),
                            );
                              }
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, "/");
                        }, child:const  Text("Already have an account"))
                      ],
                    ),
                  )
                ],
              ),
        ) ),
      ),
    );
  }
}
