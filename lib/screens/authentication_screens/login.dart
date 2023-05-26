import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final myKey = GlobalKey<FormState>();
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
                const SizedBox(height: 25,),
                Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () {
                            if(myKey.currentState!.validate()){
                                  Navigator.pushReplacementNamed(context, "/bottom_navigation_bar");
                            }
                        },
                        child: const Text("Login"),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                      ),
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
