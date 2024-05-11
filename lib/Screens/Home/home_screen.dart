import 'package:ecommerce_app/Screens/Home/widgets/categories.dart';
import 'package:ecommerce_app/Screens/Home/widgets/custom_appbar.dart';
import 'package:ecommerce_app/Screens/Home/widgets/image_slider.dart';
import 'package:ecommerce_app/Screens/Home/widgets/product_card.dart';
import 'package:ecommerce_app/Screens/Home/widgets/searchbar.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              const CustomAppBar(),
              const SizedBox(height: 20,),
              const MySearchBar(),
              const SizedBox(height: 20,),
              ImageSlider(currentSlide: currentSlider,onChange: (value){
                setState(() {
                  currentSlider = value;
                });
              }),
              const SizedBox(height: 10,),
              const Categories(),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Special for you',style: TextStyle(
                      fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),),
                  Text('see all',style: TextStyle(color: Colors.black54),)
                ],
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20), itemBuilder: (context,index){
                return ProductCard(product: products[index]);
              })
            ],
          ),
        ),
      ),
    );
  }
}
