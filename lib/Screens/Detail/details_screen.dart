import 'package:ecommerce_app/Screens/Detail/widget/addtocart.dart';
import 'package:ecommerce_app/Screens/Detail/widget/description.dart';
import 'package:ecommerce_app/Screens/Detail/widget/detail_appbar.dart';
import 'package:ecommerce_app/Screens/Detail/widget/image_slider.dart';
import 'package:ecommerce_app/Screens/Detail/widget/item_details.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      floatingActionButton: AddToCart(product: widget.product,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailAppBar(product: widget.product,),
            DetailsImageSlider(onChange: (image){
              setState(() {
                currentImage = image;
              });
            }, imagePath: widget.product.image),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3, // number of slides
                    (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: currentImage == index ? 15 : 8,
                  height: 8,
                  margin: EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: currentImage == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              color: Colors.white,
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemDetails(product: widget.product),
                    SizedBox(height: 10,),
                    Text('Colors',style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold),),
                    Row(
                      children: List.generate(widget.product.colors.length, (index) =>
                          GestureDetector(
                        onTap: (){
                          setState(() {
                            currentColor = index;
                            print(index);
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentColor == index ? Colors.white
                                : widget.product.colors[index],
                            border: currentColor == index ? Border.all(color: widget.product.colors[index]) : null
                          ),
                          padding: currentColor == index ? EdgeInsets.all(2): null,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: 30, height: 30,
                            decoration: BoxDecoration(color: widget.product.colors[index],
                            shape: BoxShape.circle,
                            boxShadow: currentColor == index ? null :[BoxShadow(color: widget.product.colors[index],blurRadius: 5),
                            ]),
                          ),
                        ),
                      )),
                    ),
                    SizedBox(height: 10,),
                    Description(description: widget.product.description)
                  ],
                ),
            ),

          ],
        ),
      ),
    ));
  }
}
