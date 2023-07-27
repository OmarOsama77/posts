import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_posts_view_model.dart';
import '../providers/user_view_model.dart';
import 'my_post_item.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<MyPostsViewModel>(context);
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: MemoryImage(
              base64Decode(viewModel.userData!.imageUrl) as Uint8List),
        ),
        SizedBox(height: 5,),
        Text("${viewModel.userData!.firstName} ${viewModel.userData!.secondName}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Text("Memes Points : 10",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600)),
        SizedBox(height: 40,),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: viewModel.userPosts.length,
            itemBuilder: (ctx, index) {
              return
                Consumer<UserViewModel>(builder:(__,viewModel2,_){
                  return MyPostItem(
                    title: viewModel.userPosts[index].title,
                    image: viewModel.userPosts[index].imageUrl,
                    userName:viewModel2.users[viewModel.userPosts[index].userId].toString(),
                    userImage: viewModel.userPosts[index].userImage,
                    id: viewModel.userPosts[index].postId.toString(),
                  );
                });
            })
      ],
    );
  }
}
