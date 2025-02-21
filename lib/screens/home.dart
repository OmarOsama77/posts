import 'package:flutter/material.dart';
import 'package:posts/providers/likes_view__model.dart';
import 'package:posts/providers/user_view_model.dart';
import 'package:posts/widgets/shimmers/home_shimmer.dart';
import '../models/user.dart';
import 'package:posts/providers/home_view_model.dart';
import 'package:posts/providers/posts_view_model.dart';
import 'package:provider/provider.dart';
import '../widgets/post_item.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
 var data = Provider.of<PostsViewModel>(context,listen: false);
 var userVM = Provider.of<UserViewModel>(context,listen: false);
 var userObj = Provider.of<HomeViewModel>(context,listen: false);
late String currentUserId;
    if(data.dataLoad==false){
      data.fetchPosts(userObj.user!.userId.toString());
      userVM.getUsers();
    }



    return Scaffold(
      body:
      RefreshIndicator(
        color: Colors.black,
        onRefresh: ()=>data.fetchPosts(userObj.user!.userId.toString()),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const  AlwaysScrollableScrollPhysics(),
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
                        currentUserId = viewModel.user!.userId!;
                        print('current user ${currentUserId}');
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
                  if(viewModel.dataLoad==false) {
                    return HomeShimmer(listL: 2,);
                  }
                  return  ListView.builder(
                     shrinkWrap: true,
                     physics:  const NeverScrollableScrollPhysics(),
                     itemCount: viewModel.posts.length,
                     itemBuilder: (ctx, index) {
                        return ChangeNotifierProvider(
                          create: (_)=>LikedViewModel(),
                          child: PostItem(
                           userId: viewModel.posts[index].userId,
                           title: viewModel.posts[index].title,
                           image: viewModel.posts[index].imageUrl,
                           userName:userVM.users[viewModel.posts[index].userId.toString()].toString(),
                           userImage: viewModel.posts[index].userImage,
                           id: viewModel.posts[index].postId.toString(),
                           currentUserId: currentUserId,

                       ),
                        );
                     });
               })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
