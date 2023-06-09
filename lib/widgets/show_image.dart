import 'dart:convert';

import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Map<String , dynamic>;
    String imageUrl = data["imageUrl"].toString();
    return Scaffold(
      body:
        Center(
          child:
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image:  DecorationImage(image:MemoryImage(base64Decode(imageUrl)),fit: BoxFit.cover)
            ),
          ),
        )
    );
  }
}
