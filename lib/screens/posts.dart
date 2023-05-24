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
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CircleAvatar(
                   radius: 30,
                   backgroundImage: AssetImage("images/ronaldo.jpg"),
                 ),
                
                 Text("Cristiano Ronaldo"),
                       IconButton(onPressed: (){}, icon: Icon(Icons.browse_gallery_sharp))
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
                   SizedBox(height: 30,),
              




                  //  Container(
                  //    width: 280,
                  //    height: 150,
                  //    decoration: BoxDecoration(
                  //      border: Border.all(
                  //        color: Colors.black,
                  //      ),
                  //    ),
                  //    child:Center(child: Text("Add Image"),),
                  //  )
                 ],
               ),
             ),
             SizedBox(height: 25,),
              Center(
                child:SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, "/bottom_navigation_bar");
                      },
                      child: const Text("Post"),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                    ),
                  ),
              )
           ],
         ),
       ),
    );
  }
}
