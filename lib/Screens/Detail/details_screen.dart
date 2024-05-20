import 'package:ecommerce_app/providers/modalsheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/Screens/Detail/widget/addtocart.dart';
import 'package:ecommerce_app/Screens/Detail/widget/colors_widget.dart';
import 'package:ecommerce_app/Screens/Detail/widget/description.dart';
import 'package:ecommerce_app/Screens/Detail/widget/detail_appbar.dart';
import 'package:ecommerce_app/Screens/Detail/widget/item_details.dart';
import 'package:ecommerce_app/Screens/Detail/widget/show_image.dart';
import 'package:ecommerce_app/models/product_model.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 0;
  // bool isModalShown = false;

  void onSelectedColor(int index) {
    setState(() {
      currentImage = index;
      currentColor = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final detailScreenProvider = Provider.of<DetailScreenProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            DetailAppBar(product: widget.product),
            ImageWidget(images: widget.product.images, currentIndex: currentImage),
            const SizedBox(height: 10),
              GestureDetector(
                onVerticalDragEnd: (details) {
                  if (details.primaryVelocity! < 0) {
                    detailScreenProvider.showProductDetailsModal(context, widget.product, onSelectedColor);
                    setState(() {
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.primaryFixedDim,
                        offset: const Offset(0, -5),
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemDetails(product: widget.product),
                      const SizedBox(height: 10),
                      const Text(
                        'Colors',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ColorSelectionRow(
                        colors: widget.product.colors,
                        onColorSelected: onSelectedColor,
                      ),
                      const SizedBox(height: 10),
                      Description(description: widget.product.description),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
