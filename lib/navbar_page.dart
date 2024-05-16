
import 'package:ecommerce_app/Screens/Cart/cart_screen.dart';
import 'package:ecommerce_app/Screens/Home/home_screen.dart';
import 'package:ecommerce_app/Screens/Favorite/fav_screen.dart';
import 'package:ecommerce_app/Screens/Profile/profile.dart';
import 'package:flutter/material.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int currentIndex = 2;
  List screens = [
    const Scaffold(),
    const FavouritesScreen(),
    const HomeScreen(),
    const CartScreen(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      floatingActionButton: FloatingActionButton(
        backgroundColor: currentIndex==2? Colors.white : Theme.of(context).colorScheme.primary,
        child: Icon(Icons.home,
          color:currentIndex==2? Theme.of(context).colorScheme.primary : Colors.white,size: 30,),
        onPressed: () {
        setState(() {
          currentIndex = 2;
        });
      },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.onTertiaryContainer,
        elevation: 10,
        padding: const EdgeInsets.all(10),
        height: 60,
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
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
                  color: currentIndex == 0 ? Theme.of(context).colorScheme.primary : Colors.grey,)
            ),
            const SizedBox(width: 10,),
            IconButton(onPressed: (){
              setState(() {
                currentIndex =1;
              });
            },
                icon: Icon(Icons.favorite_outline,size: 30,
                  color: currentIndex == 1 ? Theme.of(context).colorScheme.primary : Colors.grey,)
            ),
            const SizedBox(width: 50,),
            IconButton(onPressed: (){
              setState(() {
                currentIndex = 3;
              });
            },
                icon: Icon(Icons.shopping_cart,size: 30,
                  color: currentIndex == 3 ? Theme.of(context).colorScheme.primary : Colors.grey,)
            ),
            const SizedBox(width: 10,),
            IconButton(onPressed: (){
              setState(() {
                currentIndex = 4;
              });
            },
                icon: Icon(Icons.person,size: 30,
                  color: currentIndex == 4 ? Theme.of(context).colorScheme.primary : Colors.grey,)
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
