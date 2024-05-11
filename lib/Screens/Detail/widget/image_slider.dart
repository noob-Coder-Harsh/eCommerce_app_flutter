import 'package:flutter/material.dart';

class DetailsImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final String imagePath;
  const DetailsImageSlider({super.key, required this.onChange, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width, // Adjust width as needed
            height: 250, // Same as the height of the SizedBox
            child: PageView.builder(
              onPageChanged: onChange,
              itemBuilder: (context, index) {
                return Hero(
                    tag: imagePath,
                    child: Image.asset(imagePath));
              },
            ),
          ),
        ],
      ),
    );
  }
}
