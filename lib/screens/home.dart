import 'package:flutter/material.dart';
import 'package:posts/providers/authentication_view_model.dart';
import 'package:posts/screens/posts.dart';
import 'package:posts/screens/setting.dart';
import 'package:provider/provider.dart';

import '../widgets/post_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                Padding(
                padding:  const EdgeInsets.only(top: 25, left: 25, right: 25),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Home",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                   Consumer<AuthenticationViewModel>(builder:(_,viewModel,__){
                     return Text(
                       viewModel.currentUser!.displayName.toString(),
                     );
                   })
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                 return   PostItem();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
