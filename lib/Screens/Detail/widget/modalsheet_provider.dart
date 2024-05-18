import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import 'colors_widget.dart';
import 'description.dart';
import 'item_details.dart';

class DetailScreenProvider with ChangeNotifier {
  void showProductDetailsModal(BuildContext context, Product product, Function(int) onSelectedColor) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemDetails(product: product),
                    const SizedBox(height: 10),
                    const Text(
                      'Colors',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ColorSelectionRow(
                      colors: product.colors,
                      onColorSelected: onSelectedColor,
                    ),
                    const SizedBox(height: 10),
                    Description(description: product.description),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
