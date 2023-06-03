import 'package:flutter/material.dart';

import '../screens/comments.dart';

class PostItem extends StatelessWidget {
  const PostItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Padding(
      padding: const EdgeInsets.only( left: 20, right: 20,bottom: 25),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: const Color(0xFFFFFFFF)
        ),
        width: 270,

        child: Column(
          children: [
            const Padding(
              padding:   EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("images/s.jpg"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Cristiano Ronaldo",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding:const EdgeInsets.only(top: 15,left: 15,bottom: 20),
                child: const Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ronaldo is the best football player of all time suiiiii"),
                    SizedBox(height: 20,),
                  ],
                )
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                  image:  DecorationImage(image:AssetImage("images/ronaldo.jpg"),fit: BoxFit.fill)
              ),
            ),
             TextButton(onPressed: (){
               Navigator.pushNamed(context, "/comments");
             }, child: Text("Comments",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),)),
          ],
        ),
      ),
    );
  }
}
