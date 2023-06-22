import 'package:flutter/material.dart';
import 'package:posts/providers/my_posts_view_model.dart';

class DeleteDialog extends StatelessWidget {
   String title;
   String content;
   Function preased;

   DeleteDialog(this.title,this.content,this.preased);

  @override
  Widget build(BuildContext context) {

    return IconButton(onPressed:(){
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title:   Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                  Text(content),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel")),
                    ElevatedButton(
                      onPressed: () {
                        preased();
                        Navigator.pop(context);
                              },
                      child: const Text("Yes"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red),
                    )
                  ],
                )
              ],
            ),
          ));
    }, icon: Icon(Icons.delete));

  }
}
