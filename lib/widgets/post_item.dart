import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posts/providers/home_view_model.dart';
import 'package:posts/providers/posts_view_model.dart';
import 'package:provider/provider.dart';

import '../providers/likes_view__model.dart';
import '../screens/comments.dart';

class PostItem extends StatelessWidget {

String userName;
String title;
String image;
String userImage;
String id;
String userId;
String? currentUserId;



PostItem({
  required this.userName,
  required this.title,
  required this.userImage,
  required this.image,
  required this.id,
  required this.userId,
  this.currentUserId,

});
  @override
  Widget build(BuildContext context) {

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
              padding:   EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: MemoryImage(base64Decode(userImage) as Uint8List ),
                    ),
                    onTap: (){
                      if(currentUserId == userId){
                        Fluttertoast.showToast(msg: "This is your account you can see your posts from setting My profile");
                      }else{
                        Navigator.pushNamed(context, "/showOthersProfile",arguments: {"userId":userId});
                      }
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),

                       Text(userName),
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
             Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
              Consumer<LikedViewModel>(builder:(_,viewModel,__){
                return   IconButton(onPressed:(){
                  viewModel.toogleLiked();
                },
                    icon:viewModel.isLiked==false? Image.asset("assets/like.png",width: 25,):Image.asset("assets/liked.png",width: 25,));
              }),
                 TextButton(onPressed: (){
                   Navigator.pushNamed(context, "/comments",arguments: {"postId":id});
                 }, child: Text("Comments",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),)),
               ],
             ),
          ],
        ),
      ),
    );
  }

}
