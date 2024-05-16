import 'package:ecommerce_app/Screens/Home/widgets/custom_appbar.dart';
import 'package:ecommerce_app/Screens/Home/widgets/image_slider.dart';
import 'package:ecommerce_app/Screens/Home/widgets/product_card.dart';
import 'package:ecommerce_app/Screens/Home/widgets/searchbar.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../models/categories_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectCategories = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              const CustomAppBar(),
              const SizedBox(height: 10,),
              // const MySearchBar(),
              // const SizedBox(height: 20,),
              ImageSlider(currentSlide: currentSlider,onChange: (value){
                setState(() {
                  currentSlider = value;
                });
              }),
              const SizedBox(height: 20,),
              categoryItems(),
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
                itemCount: selectCategories[selectedIndex].length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20), itemBuilder: (context,index){
                return ProductCard(product: selectCategories[selectedIndex][index],);
              })
            ],
          ),
        ),
      ),
    );
  }
  SizedBox categoryItems() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selectedIndex == index
                    ? Theme.of(context).colorScheme.primaryFixedDim
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(categoriesList[index].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    categoriesList[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
