import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:posts/providers/my_posts_view_model.dart';
import 'package:posts/providers/posts_view_model.dart';
import 'package:posts/providers/user_view_model.dart';
import 'package:posts/screens/home.dart';
import 'package:posts/widgets/my_profile.dart';
import 'package:posts/widgets/post_item.dart';
 import 'package:provider/provider.dart';

import '../widgets/shimmers/home_shimmer.dart';
import '../widgets/my_post_item.dart';
import '../widgets/shimmers/profile_shimmer.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<MyPostsViewModel>(context);
    return Scaffold(
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                       IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back)),
                  SizedBox(width: 25,),
                  const  Text(
                      "My Profile",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),


            FutureBuilder(
                future: viewModel.findUserPosts(viewModel.userData!.userId.toString()),
                builder:(context,snapshoot){
                if(snapshoot.connectionState == ConnectionState.waiting){
                  return ProfileShimmer();
                }  else  if(snapshoot.hasData){
                  return  MyProfile();
                }else{
                      return Center(child: Text("No Posts Uploaded yet"),);
                }
            })
            ],
          ),
        ),
      ),
    );
  }
}
