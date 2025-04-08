import 'package:flutter/material.dart';
import 'package:food_delivery_app/my_cart_tile.dart';
import 'paymentpage.dart';
import 'package:food_delivery_app/restaurant.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart=restaurant.cart;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Text("Cart"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(onPressed: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Clear Cart"),
                    content: Text("Are you sure?"),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text("No",style: TextStyle(color: Colors.green))),
                      TextButton(onPressed: (){
                        restaurant.clearCart();
                        Navigator.of(context).pop();
                      }, child: Text("Yes",style: TextStyle(color: Colors.red)))
                    ],
                  );
                });
              }, icon: Icon(Icons.delete))
            ],
          ),
          body: Column(
            children: [
              userCart.isEmpty?
              Expanded(
                  child: Center(
                      child: Text("Cart is empty..."
                      )
                  )
              ):Expanded(
                child: ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context,index){
                      return MyCartTile(cartItem: userCart[index]);
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Paymentpage();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Text("Go to Checkout",
                        style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,color:Theme.of(context).colorScheme.inversePrimary)
                    )
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
