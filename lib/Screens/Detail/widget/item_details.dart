import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final Product product;
  const ItemDetails({super.key,
    required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("₹${product.price}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(40)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star,color: Colors.white,size: 15,),
                        SizedBox(width: 2,),
                        Text('${product.rate}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        SizedBox(width: 5,),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Text('seller : ',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 16),),
                  Text(product.seller,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
