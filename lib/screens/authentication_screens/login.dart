import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final myKey = GlobalKey<FormState>();
    final screenh = MediaQuery.of(context).size.height;
    final screenw = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: 
        Container(
          padding: EdgeInsets.only(top: 25, left: 0, right: 0),
          width: screenw,
          height: screenh,
          child: 
            Column(
               children: [
                  Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                         Image.asset("images/login3.png")
                    ],
            ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:25),
                    child: Row(
                      children: [
                        Text("Login",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:30,right: 30,top: 20),
                    child: Column(
                      children: [
                        TextFormField(
                  
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email), hintText: "Email"),
                      ),
                      SizedBox(height: 25,),
                      TextFormField(

                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock), hintText: "Password"),
                    ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right:30),
                child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   TextButton(onPressed: (){}, child: Text("Forgot Password ?"))
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Expanded(child: Center(
                child: Column(
                  children: [
                    SizedBox(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, "/bottom_navigation_bar");
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
                ),
              ))
          ],
         )
        ));
  }
}
