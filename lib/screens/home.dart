import 'package:flutter/material.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/models/post.dart';
import 'package:posts/providers/authentication_view_model.dart';
import 'package:posts/providers/home_view_model.dart';
import 'package:posts/providers/login_view_model.dart';
import 'package:posts/providers/posts_view_model.dart';
import 'package:posts/screens/posts.dart';
import 'package:posts/screens/setting.dart';
import 'package:provider/provider.dart';

import '../widgets/post_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 var data = Provider.of<PostsViewModel>(context,listen: false);
 data.fetchPosts();
    return Scaffold(
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Home",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Consumer<HomeViewModel>(builder: (_, viewModel, __) {
                      return Text(
                          "${viewModel.user!.firstName.toString()} ${viewModel.user!.secondName.toString()}");
                    })
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
               // viewModel.fetchPosts();
             Consumer<PostsViewModel>(builder:(_,viewModel,__){
                if(viewModel.posts.length==0){
                  return CircularProgressIndicator();
                }
                return  ListView.builder(
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                   itemCount: viewModel.posts.length,
                   itemBuilder: (ctx, index) {
                     return PostItem(
                       title: viewModel.posts[index].title,
                       image: viewModel.posts[index].imageUrl,
                       userName:viewModel.posts[index].userName,
                       userImage: viewModel.posts[index].userImage,
                       id: viewModel.posts[index].postId.toString(),
                     );
                   });
             })
            ],
          ),
        ),
      ),
    );
  }
}
