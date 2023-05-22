import 'package:flutter/material.dart';
class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final myKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
              key: myKey,
              child: Container(width: double.infinity,
                padding: const EdgeInsets.only(top: 90,right: 20,left:20),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child:
                      Container(
                        width: 300,
                        height: 250,
                        decoration: const  BoxDecoration(
                          image:DecorationImage(image: AssetImage("images/login3.png"),fit: BoxFit.cover)
                        ),
                      ),
                    ),
                    const SizedBox(height: 50,),
                    const  Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),
                    const  SizedBox(height: 25,),
                    TextFormField(
                      validator: (val){
                        if(val!.isEmpty||!val.contains('@')||val.length<=5){
                          return "Required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email"
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      validator: (val){
                        if(val!.isEmpty||val.length<=7){
                          return "Required";
                        }
                        return null;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration:const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Password"
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         TextButton(onPressed: (){}, child:const Text("Forgot Password ?",style: TextStyle(fontSize: 15),))
                      ],
                    ),
                    const    SizedBox(height: 15,),
                     Container(width: double.infinity,
                       child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           SizedBox(
                             height: 50,
                              width: 350,
                             child: ElevatedButton(onPressed: (){
                               if(myKey.currentState!.validate()){

                               }
                             }, child: const Text("Login"),
                             style: ButtonStyle(
                               shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(15)
                               ))
                             ),
                             ),
                           ),
                           const SizedBox(height: 10,),
                           TextButton(onPressed: (){
                             Navigator.pushNamed(context, "/signup");
                           }, child:const  Text("Register"))
                         ],
                       ),
                     )
                  ],
                ),
              )),
        ),
    );
  }
}
