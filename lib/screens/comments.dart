import 'package:flutter/material.dart';
import 'package:posts/providers/posts_view_model.dart';
import 'package:provider/provider.dart';

import '../providers/home_view_model.dart';

class Comments extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Container(
            width: double.infinity,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),
                  Expanded(
                    child: Text("Comments",textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                  ),
                ],
              ),
                Expanded(child:

                    ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 20, left: 15),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage("images/ronaldo.jpg"),
                              ),
                              SizedBox(width: 15,),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Cristiano Ronaldo",
                                    style: TextStyle(fontSize: 15),),
                                  Text("The best in the world",
                                      style: TextStyle(fontSize: 15))
                                ],
                              )
                            ],
                          ),
                        );
                      })
                ,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Expanded(child: TextField()),
                      IconButton(onPressed: (){

                      }, icon: Icon(Icons.arrow_upward))
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
