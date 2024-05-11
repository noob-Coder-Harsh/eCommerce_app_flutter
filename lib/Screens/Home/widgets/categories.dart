import 'package:ecommerce_app/models/categories_model.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
        return Column(
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(categoriesList[index].image),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(height: 5),
            Text(categoriesList[index].title,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
            ),
          ],
        );
      },
          separatorBuilder: (context,index){
        return SizedBox(width: 20,);},
          itemCount: categoriesList.length),
    );
  }
}
