
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posts/data/network/api_service.dart';
import 'package:posts/widgets/shimmers/comments_shimmer.dart';
import 'package:provider/provider.dart';

import '../models/commets.dart';
import '../providers/comments_view_model.dart';


class Comments extends StatelessWidget {
  TextEditingController title = TextEditingController();

  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String postId = data["postId"].toString();
    var viewModel = Provider.of<CommentsViewModel>(context,listen: false);
    viewModel.comments.clear();

    return Scaffold(
      body: RefreshIndicator(
        color: Colors.black,
        onRefresh:()=>viewModel.fetchComments(postId),
        child:
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    Expanded(
                      child: Text(
                        "Comments",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child:
                  FutureBuilder(
                      future: viewModel.fetchComments(postId),
                      builder:(context,snapshot){
                    return Consumer<CommentsViewModel>(builder: (_, viewModel, __){
                     if(snapshot.hasData) {
                       return
                         ListView.builder(
                           itemCount: viewModel.comments.length,
                           itemBuilder: (context, index) {
                             return Padding(
                               padding: EdgeInsets.only(top: 20, left: 15),
                               child: Row(
                                 children: [
                                   CircleAvatar(
                                     radius: 30,
                                     backgroundImage: MemoryImage(base64Decode(
                                         viewModel.comments[index].userImage
                                             .toString()) as Uint8List),
                                   ),
                                   SizedBox(width: 15),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment
                                         .start,
                                     children: [
                                       Container(
                                         width:250,
                                         child: Text(
                                           viewModel.comments[index]!.userName
                                               .toString(),
                                           style: TextStyle(fontSize: 15),
                                         ),
                                       ),
                                       Container(
                                         width:250,
                                         child: Text(
                                           viewModel.comments[index]!.title
                                               .toString(),
                                           style: TextStyle(fontSize: 15),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                             );
                           },
                         );
                     }
                     else {
                       return CommentsShimmer();
                     }
                    });
                  })
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: TextField(controller: title)),
                      Consumer<CommentsViewModel>(builder: (_, viewModel, __) {
                        return IconButton(
                          onPressed: () {
                            String uid = viewModel.generateCommentId();
                            viewModel.addComment(
                              postId,
                              Comment(
                                id: uid,
                                userName: "${viewModel.user!.firstName} ${viewModel.user!.secondName}",
                                title: title.text,
                                userImage: viewModel.user!.imageUrl,
                              ),
                            );
                            title.clear();
                            Fluttertoast.showToast(msg: "Please Refresh to see your comment");
                          },
                            icon:Image.asset("assets/sendComment.png",width: 30,)
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
