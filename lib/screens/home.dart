import 'package:flutter/material.dart';
import 'package:posts/screens/posts.dart';
import 'package:posts/screens/setting.dart';

import '../widgets/post_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = 0.8 * screenWidth;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Home",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      "Cristiano Ronaldo",
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                 return PostItem();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
