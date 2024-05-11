import 'dart:async';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final Function(int) onChange;
  final int currentSlide;

  ImageSlider({
    Key? key,
    required this.onChange,
    required this.currentSlide,
  }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == null) return;
      int nextPage = (_pageController.page!.toInt() + 1) % 3; // Number of slides
      _pageController.animateToPage(
        nextPage,
        duration: Duration(seconds: 1),
        curve: Curves.ease,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.225,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              controller: _pageController,
              physics: const ClampingScrollPhysics(),
              allowImplicitScrolling: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: widget.onChange,
              children: [
                Image.asset(
                  'assets/slider.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/slider3.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/image1.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3, // number of slides
                    (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: widget.currentSlide == index ? 15 : 8,
                  height: 8,
                  margin: EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: widget.currentSlide == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
