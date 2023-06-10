import 'package:flutter/material.dart';
import 'package:posts/providers/my_posts_view_model.dart';
import 'package:posts/screens/home.dart';
 import 'package:provider/provider.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MyPostsViewModel>(context);
    data.getuserPosts();
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


                   ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (ctx, index) {
                      return Text("data");

              })
            ],
          ),
        ),
      ),
    );
  }
}
