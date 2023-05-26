import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
       body:
        Padding(
          padding: const EdgeInsets.only(top:55,left: 25,right: 25),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create Post",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("images/ronaldo.jpg"),
                  ),
                  SizedBox(width: 10,),
                  Text("Cristiano Ronaldo"),
                ],
              ),
              const SizedBox(height: 25,),
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration.collapsed(hintText: "What is on your mind ? "),
                    ),
                  ),
                    IconButton(onPressed: (){}, icon:  const Icon(Icons.camera_alt))
                ],
              ),
              const SizedBox(height: 20,),
              Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () {

                        },
                            child: const  Text("Post"),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
