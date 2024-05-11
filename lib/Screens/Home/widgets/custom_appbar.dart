import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){},
            icon: Image.asset('assets/icon.png',width: 25,height: 25,)
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.notifications))
      ],
    );
  }
}
