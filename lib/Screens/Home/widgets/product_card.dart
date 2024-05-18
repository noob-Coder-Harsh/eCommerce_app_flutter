import 'package:ecommerce_app/Screens/Detail/details_screen.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/providers/fav_provider.dart';
import 'package:flutter/material.dart';


class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
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
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 150,
                  width: double.infinity,
                  child: Hero(
                    tag: '${product.id}-0',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: 150,
                        child: Image.asset(
                          product.images[0], // Display the first image in the list
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.title,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "₹${product.price}",
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      children: List.generate(
                          product.colors.length,
                          (index) => Container(
                                width: 15,
                                height: 15,
                                margin: const EdgeInsets.only(left: 4),
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
                              color: Theme.of(context).colorScheme.primaryFixedDim,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)
                              )
                            ),
                  child: IconButton(onPressed: (){
                    provider.toggleFavorite(product);
                  }, icon: Icon(
                    provider.isExist(product)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white,
                    size: 22,
                  ),)
                          ),
              ))
        ],
      ),
    );
  }
}
