import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product_model.dart';

class SearchWidget extends StatefulWidget {
  final List<Product> allProducts;
  final Function(List<Product>) onSearchResults;

  const SearchWidget({Key? key, required this.allProducts, required this.onSearchResults}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterProducts);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterProducts);
    _searchController.dispose();
    super.dispose();
  }

  void _filterProducts() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      widget.onSearchResults([]);
    } else {
      final filteredProducts = widget.allProducts.where((product) {
        return product.title.toLowerCase().contains(query) ||
            product.description.toLowerCase().contains(query) ||
            product.category.toLowerCase().contains(query);
      }).toList();
      widget.onSearchResults(filteredProducts);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(child: Text('Search')),
          Expanded(
            flex: 3,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search...',
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
    );
  }
}
