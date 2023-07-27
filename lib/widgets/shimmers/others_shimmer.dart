import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'home_shimmer.dart';

class OthersShimmer extends StatelessWidget {
  const OthersShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(baseColor:Colors.grey[500]!,highlightColor:Colors.grey[100]!,
      child:Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                ),
                SizedBox(height: 7,),
                Container(
                  width: 140,
                  height: 25,
                  color: Colors.grey,
                ),
                SizedBox(height: 7,),
                Container(
                  width: 140,
                  height: 25,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(height: 10,),
            HomeShimmer(listL: 1),
          ],
        ),
      ),
    );
  }
}
