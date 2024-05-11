import 'package:ecommerce_app/Screens/Detail/details_screen.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      product: product,
                    )));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Hero(
                  tag: product.image,
                  child: Image.asset(
                    product.image,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  product.title,
                  style: TextStyle(fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "₹${product.price}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      children: List.generate(
                          product.colors.length,
                          (index) => Container(
                                width: 15,
                                height: 15,
                                margin: EdgeInsets.only(left: 4),
                                decoration: BoxDecoration(
                                    color: product.colors[index],
                                    shape: BoxShape.circle),
                              )),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                    height: 40,
                    width: 40,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)
                              )
                            ),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline,color: Colors.white,size: 22,),)
                          ),
              ))
        ],
      ),
    );
  }
}
