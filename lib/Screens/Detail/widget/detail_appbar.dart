import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios)),
          Spacer(),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.favorite_outline)),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.share))

        ],
      ),
    );
  }
}
