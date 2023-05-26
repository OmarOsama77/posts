import 'package:flutter/material.dart';


class Signup extends StatelessWidget {
    Signup({Key? key}) : super(key: key);
  TextEditingController password = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final myKey = GlobalKey<FormState>();
    final screenh = MediaQuery.of(context).size.height;
    final screenw = MediaQuery.of(context).size.width;
    return Scaffold(
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 25,right: 25,top: screenh/9),
        width: screenw,
        height: screenh,
        child: Column(
          children: [
            const Row(
              children: [
                Text('Register',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ],
            ),
            const  Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                )
              ],
            ),
            Column(children: [
              TextFormField(
                validator: (val){
                  if(val!.isEmpty||val.length<2){
                    return "Required";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "First Name"
                ),
              ),
              const SizedBox(height: 30,),
              TextFormField(
                validator: (val){
                  if(val!.isEmpty||val.length<2){
                    return "Required";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Second Name"
                ),
              ),
              const SizedBox(height: 30,),
              TextFormField(
                validator: (val){
                  if(val!.isEmpty||val.length<2){
                    return "Required";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Email"
                ),
              ),
              const SizedBox(height: 30,),
              TextFormField(
                validator: (val){
                  if(val!.isEmpty||val.length<2){
                    return "Required";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration:const InputDecoration(
                    hintText: "Password"
                ),
              ),
              const SizedBox(height: 30,),
              TextFormField(
                validator: (val){
                  if(val!.isEmpty||val.length<2){
                    return "Required";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration:const InputDecoration(
                    hintText: "Confirm Password"

                ),
              ),
            ],),
            Expanded(child:Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, "/bottom_navigation_bar");
                    },
                    child: const Text("Register"),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)))),
                  ),
                ),
                const SizedBox(height: 10,),
                TextButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, "/");
                }, child:const  Text("Already have an account"))
              ],
            ))
          ],
        ),
      ),
    ),
    );
  }
}
