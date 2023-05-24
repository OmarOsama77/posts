import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 50,left: 25,right: 25),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create post",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 20,),
               Container(
               width: 400,
                height: 200,
                 decoration: BoxDecoration(
                   border: Border.all(width: 2,color: Colors.black),
                   borderRadius: BorderRadius.all(Radius.circular(25)),
                 ),
                 child: Center(child: Text("Add Image",style: TextStyle(fontSize: 25),)),
               ),
                  SizedBox(height: 20,),
                TextField(
                  maxLines: 8,
                  style: TextStyle(
                      fontSize: 18, overflow: TextOverflow.clip),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: const BorderSide(
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1),
                    ),
                  ),
                ),
                SizedBox(height: 70,),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(onPressed: (){

                  }, child: const Text("Post"),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ))
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
