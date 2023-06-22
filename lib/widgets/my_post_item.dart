import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posts/providers/home_view_model.dart';
import 'package:posts/providers/posts_view_model.dart';
import 'package:posts/widgets/delete_dialog.dart';
import 'package:provider/provider.dart';

import '../providers/my_posts_view_model.dart';
import '../screens/comments.dart';

class MyPostItem extends StatelessWidget {

  String userName;
  String title;
  String image;
  String userImage;
  String id;


  MyPostItem({
    required this.userName,
    required this.title,
    required this.userImage,
    required this.image,
    required this.id});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<MyPostsViewModel>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20,bottom: 25),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: const Color(0xFFFFFFFF)
        ),
        width: 270,
        child: Column(
          children: [
            Padding(
              padding:EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: MemoryImage(base64Decode(userImage) as Uint8List ),
                  ),
                  SizedBox(
                    width: 20,
                  ),

                  Container(
                    width: 220,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(userName),
                        DeleteDialog("Delete Post","Are you sure you want to delete this post",()async{
                          await viewModel.removePost(id);
                           if(viewModel.statusCode==200){
                             Fluttertoast.showToast(msg: "Post Deleted");
                           }
                        }),

                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:const EdgeInsets.only(top: 15,left: 15,bottom: 20),
              child:

              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  SizedBox(height: 20,),
                ],
              )
              ,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/showImage",arguments: {"imageUrl":image});
              },
              child: Container(
                width: double.infinity,
                height: 150,
                decoration:   BoxDecoration(
                    image:  DecorationImage(image:MemoryImage(base64Decode(image)),fit: BoxFit.fitWidth)
                ),
              ),
            ),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, "/comments",arguments: {"postId":id});
            }, child: Text("Comments",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),)),
          ],
        ),
      ),
    );
  }

}
