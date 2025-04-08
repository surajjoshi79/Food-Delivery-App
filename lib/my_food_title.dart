import 'package:flutter/material.dart';
import 'foods.dart';

class MyFoodTitle extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const MyFoodTitle({super.key,required this.food,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 19,top: 15,bottom: 15),
            child: Row(
              children: [
                Container(
                  width: 260,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      SizedBox(height: 10),
                      Text("\$"+food.price.toString(),style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                      SizedBox(height: 10),
                      Text(food.description,style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary))
                    ],
                  ),
                ),
                SizedBox(width: 8),
                ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset(food.imagePath,height: 100,width: 95,fit: BoxFit.fill)),
                SizedBox(height: 10),
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.tertiary,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
