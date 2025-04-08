import 'package:flutter/material.dart';
import 'package:food_delivery_app/cartitem.dart';
import 'package:food_delivery_app/my_quantity_tile.dart';
import 'package:food_delivery_app/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key,required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder:(context,restaurant,child){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8)
            ),
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.asset(cartItem.food.imagePath,height: 100,width: 100,)),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartItem.food.name),
                        Text("\$"+cartItem.food.price.toString(),
                            style: TextStyle(color: Theme.of(context).colorScheme.primary)
                        )
                      ],
                    ),
                    Spacer(),
                    MyQuantityTile(
                        quantity: cartItem.quantity,
                        onDecrement: (){
                          restaurant.removeFromCart(cartItem);
                        },
                        onIncrement: (){
                          restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                        }
                    )
                  ],
                ),
                SizedBox(
                  height: cartItem.selectedAddons.isEmpty?0:60,
                  child: ListView(
                    padding: EdgeInsets.only(left:10,right: 10,bottom: 10),
                    scrollDirection: Axis.horizontal,
                    children:
                      cartItem.selectedAddons.map((addons)=>
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: FilterChip(
                            backgroundColor: Theme.of(context).colorScheme.background,
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 12
                            ),
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary
                              )
                            ),
                            label: Row(
                              children: [
                                Text(addons.name),
                                Text(" \$ "+addons.price.toString()
                                )
                              ],
                            ),
                            onSelected: (value){},
                          ),
                        )
                      ).toList()
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
