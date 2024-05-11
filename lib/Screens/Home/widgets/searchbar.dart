import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: [
          Icon(Icons.search,color: Colors.grey,),
          SizedBox(width: 10,),
          Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'search...',
                border: InputBorder.none
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: VerticalDivider(width: 5),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.tune,color: Colors.grey,))
        ],
      ),
    );
  }
}
