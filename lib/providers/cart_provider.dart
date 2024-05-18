
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier{
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void addToCart(Product product) {
    bool productExists = false;
    for (Product element in _cart) {
      if (element.id == product.id) {
        element.quantity++;
        productExists = true;
        break;
      }
    }
    if (!productExists) {
      _cart.add(product);
    }
    notifyListeners();
  }

  incrementQty(int index){
    _cart[index].quantity++;
    notifyListeners();
  }

  decrementQty(int index){
    if(_cart[index].quantity<=1){
      return;
    }else{
      _cart[index].quantity--;
      notifyListeners();
    }
  }

  totalPrice(){
    double total1 = 0.0;
    for(Product element in _cart){
      total1+=element.price*element.quantity;
    }
    return total1;
  }



  static CartProvider of(BuildContext context,
  {bool listen = true}
  ){
    return Provider.of<CartProvider>(
      context, listen: listen
    );
  }
}