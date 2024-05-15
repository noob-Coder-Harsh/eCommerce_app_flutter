
import 'package:ecommerce_app/Screens/Cart/cart_screen.dart';
import 'package:ecommerce_app/Screens/Home/home_screen.dart';
import 'package:ecommerce_app/Screens/Favorite/fav_screen.dart';
import 'package:flutter/material.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int currentIndex = 2;
  List screens = [
    Scaffold(),
    FavouritesScreen(),
    HomeScreen(),
    CartScreen(),
    Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: currentIndex==2? Colors.deepOrange: Colors.white,
        child: Icon(Icons.home,
          color:currentIndex==2? Colors.white: Colors.deepOrange,size: 30,),
        onPressed: () {
        setState(() {
          currentIndex = 2;
        });
      },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        padding: EdgeInsets.all(10),
        height: 60,
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(onPressed: (){
              setState(() {
                currentIndex = 0;
              });
            },
                icon: Icon(Icons.grid_view_outlined,size: 30,
                  color: currentIndex == 0 ? Colors.deepOrange : Colors.grey,)
            ),
            SizedBox(width: 10,),
            IconButton(onPressed: (){
              setState(() {
                currentIndex =1;
              });
            },
                icon: Icon(Icons.favorite_outline,size: 30,
                  color: currentIndex == 1 ? Colors.deepOrange : Colors.grey,)
            ),
            SizedBox(width: 50,),
            IconButton(onPressed: (){
              setState(() {
                currentIndex = 3;
              });
            },
                icon: Icon(Icons.shopping_cart,size: 30,
                  color: currentIndex == 3 ? Colors.deepOrange : Colors.grey,)
            ),
            SizedBox(width: 10,),
            IconButton(onPressed: (){
              setState(() {
                currentIndex = 4;
              });
            },
                icon: Icon(Icons.person,size: 30,
                  color: currentIndex == 4 ? Colors.deepOrange : Colors.grey,)
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
