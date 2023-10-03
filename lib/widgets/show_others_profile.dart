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
    return  SingleChildScrollView(
      physics: const  AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top: 55,),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  IconButton(onPressed:(){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back,size: 30,)),
                ],
              ),
            ),
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
              ],
            ),

            SizedBox(
              child: ListView.builder(
                  shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}
