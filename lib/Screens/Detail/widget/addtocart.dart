import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  final Product product;
  const AddToCart({super.key, required this.product});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
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
                      onPressed: (){
                        setState(() {
                          currentIndex--;
                        });
                      },
                      splashColor: Colors.white,
                      splashRadius: 10,
                      icon: const Icon(Icons.remove,color: Colors.white,)),
                  const SizedBox(width: 10,),
                  Text('$currentIndex',style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                  const SizedBox(width: 10,),
                  IconButton(
                      onPressed: (){
                        setState(() {
                          currentIndex++;
                        });
                      },
                      splashColor: Colors.white,
                      splashRadius: 10,
                      icon: const Icon(Icons.add,color: Colors.white,))
                ],
              ),
            ),
            const SizedBox(width: 20,),
            GestureDetector(
              onTap: (){
                provider.toggleFavourite(widget.product);
                const snackBar = SnackBar(
                  content: Text(
                    "Successfully added!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepOrange
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 40),
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
