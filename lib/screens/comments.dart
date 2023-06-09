import 'package:flutter/material.dart';
import 'package:posts/Api/api_service.dart';
import 'package:provider/provider.dart';

import '../models/commets.dart';
import '../providers/comments_view_model.dart';

class Comments extends StatelessWidget {
  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String postId = data["postId"].toString();
    List<Comment> comment = [];
    var viewModel = Provider.of<CommentsViewModel>(context,listen: true);
   viewModel.getComments(postId) ;
    print('object ${viewModel.comments.length}');
    print("co ${comment.length}");
    return Scaffold(
      body: Padding(
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
                child: Consumer<CommentsViewModel>(builder: (_, viewModel, __){

                  return ListView.builder(
                    itemCount:viewModel.comments.length,
                    itemBuilder: (context, index) {

                      return Padding(
                        padding: EdgeInsets.only(top: 20, left: 15),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("images/ronaldo.jpg"),
                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "comment.userName",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "comment.title",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
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
                        },
                        icon: Icon(Icons.arrow_upward),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
