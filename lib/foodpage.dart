import 'package:flutter/material.dart';
import 'package:food_delivery_app/restaurant.dart';
import 'package:provider/provider.dart';
import 'foods.dart';

class Foodpage extends StatefulWidget {
  final Food food;
  final Map<Addons,bool> selectedAddons={};

  Foodpage({super.key,required this.food}){
    for(Addons addons in food.addons){
      selectedAddons[addons]=false;
    }
  }

  @override
  State<Foodpage> createState() => _FoodpageState();
}

class _FoodpageState extends State<Foodpage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(widget.food.imagePath),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.food.name,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                      SizedBox(height: 10),
                      Text("\$"+widget.food.price.toString(),style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary
                      )),
                      SizedBox(height: 10),
                      Text(widget.food.description,style: TextStyle(
                          fontSize: 16
                      )),
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(height: 10),
                      Text("Add-ons",style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      )),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.addons.length,
                          itemBuilder: (context,index){
                            return CheckboxListTile(
                              title: Text(widget.food.addons[index].name),
                              subtitle: Text("\$"+widget.food.addons[index].price.toString(),style: TextStyle(
                                  color:Theme.of(context).colorScheme.primary
                              )),
                              value: widget.selectedAddons[widget.food.addons[index]],
                              onChanged: (value){
                                setState(() {
                                  widget.selectedAddons[widget.food.addons[index]]=value!;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: ElevatedButton(
                      onPressed: (){
                        List<Addons> currentAddons=[];
                        for(Addons addons in widget.food.addons){
                          if(widget.selectedAddons[addons]==true){
                            currentAddons.add(addons);
                          }
                        }
                        Navigator.of(context).pop();
                        Provider.of<Restaurant>(context,listen: false).addToCart(widget.food, currentAddons);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Text("Add to cart",
                          style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.bold,color:Theme.of(context).colorScheme.inversePrimary)
                      )
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary,
              ),
              child:IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: Icon(Icons.arrow_back)),
            ),
          ),
        )
      ],
    );
  }
}
