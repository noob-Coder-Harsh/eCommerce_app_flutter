import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  final List<String> images;
  final int currentIndex;

  const ImageWidget({
    required this.images,
    required this.currentIndex,
  });

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  void _showFullScreenImage(String tag, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(0),
          child: Center(
            child: Hero(
              tag: tag,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _showFullScreenImage(
            'image-${widget.currentIndex}',
            widget.images[widget.currentIndex],
          );
        },
        child: Hero(
          tag: 'image-${widget.currentIndex}',
          child: Image.asset(
            widget.images[widget.currentIndex],
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
