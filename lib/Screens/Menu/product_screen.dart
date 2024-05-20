import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product_model.dart';

import '../Home/widgets/product_card.dart'; // Assuming you have a product model

class ProductScreen extends StatelessWidget {
  final List<Product> products;
  final String categoryTitle;

  const ProductScreen({Key? key, required this.products, required this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.55,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}
