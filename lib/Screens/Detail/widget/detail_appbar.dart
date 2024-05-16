import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/providers/fav_provider.dart';
import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios)),
          Spacer(),
          IconButton(onPressed: (){
            provider.toggleFavorite(product);
          }, icon: Icon(provider.isExist(product) ? Icons.favorite : Icons.favorite_outline)),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.share))

        ],
      ),
    );
  }
}
