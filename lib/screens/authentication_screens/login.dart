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
        body: Container(
          padding: EdgeInsets.only(top: 25, left: 0, right: 0),
          width: screenw,
          height: screenh,
          child: Column(
            children: [
              Image.asset("images/login3.png",),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, top: 15),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(

                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email), hintText: "Email"),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(

                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock), hintText: "Password"),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       TextButton(onPressed: (){}, child: Text("Forgot passsword ?"))
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(height: 10,),
                  TextButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, "/signup");
                  }, child:const  Text("Register"))
                ],
              ))
            ],
          ),
        ));
  }
}
