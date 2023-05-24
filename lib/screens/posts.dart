import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenh = MediaQuery.of(context).size.height;
    final screenw = MediaQuery.of(context).size.width;
    return  Scaffold(

       body: Container(
         padding: EdgeInsets.only(top: screenh/11,left: screenw/45,right: screenw/45),
         width:screenw,
         height:screenh,
         child: Column(
           children: [
              Text("Create Post",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
             Row(
               children: [
                 CircleAvatar(
                   radius: 30,
                   backgroundImage: AssetImage("images/ronaldo.jpg"),
                 ),
                 SizedBox(width: 20,),
                 Text("Cristiano Ronaldo")
               ],
             ),

             Padding(
               padding:   EdgeInsets.only(top:screenh/44),
               child: Column(mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   TextFormField(
                     decoration: InputDecoration(
                       hintText: "What is on your mind ?",
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(22)
                       )
                     ),
                   ),
                   Container(
                     width: 250,
                     height: 250,
                     decoration: BoxDecoration(
                       border: Border.all(
                         color: Colors.black,
                       ),
                     ),
                   )
                 ],
               ),
             )
           ],
         ),
       ),
    );
  }
}
