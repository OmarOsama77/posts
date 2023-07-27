import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:posts/widgets/shimmers/comments_shimmer.dart';
import 'package:posts/widgets/shimmers/others_shimmer.dart';
import 'package:posts/widgets/shimmers/profile_shimmer.dart';
import 'package:posts/widgets/show_others_profile.dart';
import 'package:provider/provider.dart';

import '../providers/show_others_profile.dart';

class ShowOthersProfile extends StatelessWidget {
  const ShowOthersProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<ShowOthersProfileVM>(context);
    var data = ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, String>;
    String userId = data["userId"].toString();
    return Scaffold(
        body:
        FutureBuilder(
          future: Future.wait([
            viewModel.getUserData(userId),
            viewModel.getUserPosts(userId),
          ]),
          builder: (ctx, snapshoot) {
            if (snapshoot.hasData) {
              return ShowOthersProfileWidget(userId: userId,
                  firstName:  viewModel.user.firstName,
                  secondName: viewModel.user.secondName,
                  imageUrl:   viewModel.user.imageUrl,
                  userPosts:  viewModel.userPosts);
            }
            return OthersShimmer();
          },)
    );
  }
}
