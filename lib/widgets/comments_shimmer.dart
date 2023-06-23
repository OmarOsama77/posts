import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommentsShimmer extends StatelessWidget {
  const CommentsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, snapshoot) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 175,
                        height: 15,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 175,
                        height: 15,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
