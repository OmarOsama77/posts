import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:posts/widgets/post_item.dart';

import '../models/post.dart';

class ShowOthersProfileWidget extends StatelessWidget {
  String userId;
  String firstName;
  String secondName;
  String imageUrl;
  List<Post> userPosts;

  ShowOthersProfileWidget(
      {
       required this.userId,
        required this.firstName,
        required this.secondName,
        required this.imageUrl,
        required this.userPosts});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top: 55, left: 15, right: 25),
      child: Column(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: MemoryImage(
                    base64Decode(imageUrl) as Uint8List),
              ),
              SizedBox(height: 10,),
              Text("${firstName} ${secondName}", style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Memes Point "),
                  Text("20",
                    style: TextStyle(color: Colors.red, fontSize: 25),),
                ],
              )
            ],
          ),

          Expanded(
            child: ListView.builder(
                itemCount:userPosts.length,
                itemBuilder: (ctx, index) {
                  return PostItem(
                      userName: userPosts[index]!.userName.toString(),
                      title: userPosts[index]!.title.toString(),
                      userImage:  userPosts[index]!.userImage.toString(),
                      image:   userPosts[index]!.imageUrl.toString(),
                      id:  userPosts[index]!.postId.toString(),
                      userId: userId
                  );
                }),
          )
        ],
      ),
    );
  }
}
