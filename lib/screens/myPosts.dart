import 'package:flutter/material.dart';
import 'package:posts/providers/my_posts_view_model.dart';
import 'package:posts/screens/home.dart';
import 'package:posts/widgets/post_item.dart';
 import 'package:provider/provider.dart';

import '../widgets/home_shimmer.dart';
import '../widgets/my_post_item.dart';

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
                      "My Posts",
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
                  return HomeShimmer();
                }  else  if(snapshoot.hasData){
                  return   ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: viewModel.userPosts.length,
                      itemBuilder: (ctx, index) {
                        return MyPostItem(
                          title: viewModel.userPosts[index].title,
                          image: viewModel.userPosts[index].imageUrl,
                          userName:viewModel.userPosts[index].userName,
                          userImage: viewModel.userPosts[index].userImage,
                          id: viewModel.userPosts[index].postId.toString(),
                        );
                      });
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
