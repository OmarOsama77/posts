import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
      Container(
        padding: EdgeInsets.only(top: 80),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Settings",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height: 30,),
           SizedBox(
             width: screenWidth-20,
             child:  TextFormField(

               decoration: InputDecoration(
                 border: OutlineInputBorder(
                   borderRadius: const BorderRadius.all(
                     const Radius.circular(10.0),
                   ),
                   borderSide: BorderSide(
                     width: 2,
                     style: BorderStyle.solid,
                   ),
                 ),
               ),
             ),
           )


          ],
        ),
      )
    );
  }
}
