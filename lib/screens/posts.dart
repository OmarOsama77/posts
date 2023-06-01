import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posts/providers/upload_post_view_model.dart';
import 'package:provider/provider.dart';

import '../providers/authentication_view_model.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationViewModel auth = AuthenticationViewModel();
    TextEditingController title = TextEditingController();
    final myKey = GlobalKey<FormState>();
    return  Scaffold(
       body:
        Form(
          key: myKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top:55,left: 25,right: 25),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Create Post",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      ],
                    ),
                   Consumer<AuthenticationViewModel>(builder: (_,viewModel,__){
                     return  Row(
                       children: [
                         CircleAvatar(
                           radius: 30,
                           backgroundImage: AssetImage("images/ronaldo.jpg"),
                         ),
                         SizedBox(width: 10,),
                         Text(viewModel.currentUser!.displayName.toString()),
                       ],
                     );
                   }),
                  const SizedBox(height: 25,),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          controller: title,
                          validator: (val){
                            if(val!.isEmpty||val.length<5){
                              return "Required";
                            }
                            return null;
                          },
                          decoration: const InputDecoration.collapsed(hintText: "What is on your mind ? "),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 20,),
                Consumer<UploadPost>(builder: (_,viewModel,__){
                  return   Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                           viewModel.image == null ?
                              GestureDetector(
                                child: Container(
                                  width: 280,
                                  height: 220,
                                  color: Color.fromRGBO(200, 200, 200, 1.0),
                                  child: Center(child: Text("Upload Image"),),
                                ),
                                onTap: (){
                                  viewModel.getImage();
                                },
                              )
                              :GestureDetector(
                                child: Container(
                                 width: 280,
                                 height: 220,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(image: FileImage(File(viewModel.image!.path)) as ImageProvider,fit: BoxFit.contain)
                                 ),
                                ),
                             onTap: (){
                               viewModel.getImage();
                             },
                              ),

                        SizedBox(height: 25,),
                        SizedBox(
                          height: 50,
                          width: 350,
                          child: ElevatedButton(
                            onPressed: () {
                                if(myKey.currentState!.validate()&&viewModel.isThereImage()){
                                  viewModel.uploadUserImage();
                                    viewModel.sendPost(auth.currentUser!.displayName.toString(), title.text, viewModel.userImage.toString(), []);
                                }else{
                                  Fluttertoast.showToast(msg: "Please try again");
                                }
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
                  );
                })
                ],
              ),
            ),
          ),
        )
    );
  }
}
