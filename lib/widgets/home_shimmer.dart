import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[500]!, // Adjust base color as needed
          highlightColor: Colors.grey[100]!, // Adjust highlight color as needed
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
              ),
              width: 270,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Row(
                      children: [
                       const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey,
                        ),

                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 105,
                          height: 20,
                          color: Colors.grey,
                        ) // Replace with actual username
                      ],
                    ),
                  ),
               const   SizedBox(height: 15,),
                  Container(
                    width: 280,
                    height: 25,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration:const BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 45,
                        height: 25,
                        color: Colors.grey,
                      ),
                      Container(
                        width: 85,
                        height: 25,
                        color: Colors.grey,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
