import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30)
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 1,color: Colors.white),
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){},
                      splashColor: Colors.white,
                      splashRadius: 10,
                      icon: Icon(Icons.remove,color: Colors.white,)),
                  SizedBox(width: 10,),
                  Text('$currentIndex',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  IconButton(
                      onPressed: (){},
                      splashColor: Colors.white,
                      splashRadius: 10,
                      icon: Icon(Icons.add,color: Colors.white,))
                ],
              ),
            ),
            SizedBox(width: 20,),
            GestureDetector(
              onTap: (){},
              child: Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepOrange
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 40),
                  child: Text('Add to cart',
                    style: TextStyle(color: Colors.white,fontSize: 16),),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
