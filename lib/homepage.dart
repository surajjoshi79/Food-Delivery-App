import 'package:flutter/material.dart';
import 'package:food_delivery_app/cartpage.dart';
import 'package:food_delivery_app/foodpage.dart';
import 'package:food_delivery_app/foods.dart';
import 'package:food_delivery_app/my_food_title.dart';
import 'package:food_delivery_app/my_tab_bar.dart';
import 'package:food_delivery_app/restaurant.dart';
import 'package:provider/provider.dart';
import 'mydrawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  String location="";
  TextEditingController loc=TextEditingController();
  @override
  void initState() {
    super.initState();
    _tabController=TabController(length: FoodCategory.values.length, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    loc.dispose();
    super.dispose();
  }
  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Your Location"),
            content: TextField(
              controller: loc,
              decoration: InputDecoration(
                  hintText: "Enter your location"
              ),
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text("cancel")),
              TextButton(onPressed: () {
                context.read<Restaurant>().saveDeliveryAddress(loc.text);
                setState(() {
                  location = loc.text;
                });
                Navigator.of(context).pop();
              }, child: Text("save"))
            ],
          );
        }
    );
  }
  List<Food> _filterMenuByCategory(FoodCategory category,List<Food> fullMenu){
    return fullMenu.where((food) => food.category ==category).toList();
  }
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category){
      List<Food> categoryMenu=_filterMenuByCategory(category, fullMenu);
        return ListView.builder(
            itemCount: categoryMenu.length,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context,index){
              return MyFoodTitle(food: categoryMenu[index], onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return Foodpage(food: categoryMenu[index]);
                }));
              });
            }
        );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context,innerBoxIsScrolled)=>[
          SliverAppBar(
            expandedHeight: 340,
            collapsedHeight: 120,
            floating: false,
            pinned: true,
            actions: [
              IconButton(onPressed: (){
                setState(() {});
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return Cartpage();
                }));
              }, icon: Icon(Icons.shopping_cart_outlined,color: Theme.of(context).colorScheme.inversePrimary))
            ],
            backgroundColor: Theme.of(context).colorScheme.background,
            centerTitle: true,
            title: Text("Sunset Diner",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
            flexibleSpace: FlexibleSpaceBar(
              title: MyTabBar(tabController: _tabController),
              centerTitle: true,
              background: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.secondary
                    ),
                    //Current Location
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Deliver now",style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          )),
                          GestureDetector(
                            onTap: (){
                              openLocationSearchBox(context);
                            },
                            child: Row(
                              children: [
                                Text(location!=""?location:"ABC Location",style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary
                                )),
                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    //Description Box
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Theme.of(context).colorScheme.secondary),
                        ),
                        padding: EdgeInsets.all(25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("\$${context.read<Restaurant>().getTotalPrice().toString()}",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
                                Text("Delivery Fee",style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("15-20 min",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
                                Text("Delivery Time",style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              titlePadding: EdgeInsets.only(left:0,right: 0,top:0),
            ),
          ),
        ],
        body: Consumer<Restaurant>(
            builder: (context,restaurant,child) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            )
        )
        ),
    );
  }
}
