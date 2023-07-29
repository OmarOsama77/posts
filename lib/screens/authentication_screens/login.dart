

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posts/providers/authentication_view_model.dart';
import 'package:posts/providers/login_view_model.dart';


import 'package:provider/provider.dart';

class Login extends StatelessWidget {

  Login({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController forgotPass = TextEditingController();
  void showForgetPassDialog(BuildContext context, Function onClick,TextEditingController controller) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Forgot your password"),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email Address"
            ),
          ),
          actions: [
            ElevatedButton(onPressed: () {
              onClick();

            }, child: const Text("Submit"))
          ],
        ));
  }

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
                        Consumer<LoginViewModel>(
                          builder: (_, viewModel, __) {
                            return TextFormField(
                              validator: (val) {
                               if(val!.isEmpty||val.length<5){
                                return "Required";
                               }
                               return null;
                              },
                              controller: password,
                              obscureText: viewModel.passwordObsecure,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(viewModel.passwordObsecure ? Icons.visibility : Icons.visibility_off),
                                  onPressed: () {
                                    viewModel.tooglePassword();
                                  },
                                ),
                                hintText: "Password",
                              ),
                            );
                          },
                        )


                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){
                      showForgetPassDialog(context, (){
                        authViewModel.forgetPass(forgotPass.text.trim());
                        Fluttertoast.showToast(msg: "Please check your email");
                      }, forgotPass);
                    }, child: const Text("Forgot Passowrd ?"))
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
                           try{
                             if(await authViewModel.login(email.text.trim(), password.text.trim())){
                               viewModel.toogleLoading();
                               await viewModel.findUserByEmail(email.text.trim());
                               Navigator.pushReplacementNamed(context, "/bottom_navigation_bar");
                               viewModel.toogleLoading();
                             }
                           }catch(e){
                             Fluttertoast.showToast(msg: e.toString());
                           }
                         }
                       },
                       child:viewModel.isLoading?CircularProgressIndicator(color: Colors.white,): const Text("Login"),
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