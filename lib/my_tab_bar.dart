import 'package:flutter/material.dart';
import 'package:food_delivery_app/foods.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key,required this.tabController});
  List<Tab> _buildCategoryTab(){
    return FoodCategory.values.map((category){
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        labelStyle: TextStyle(
          fontSize: 8
        ),
        controller: tabController,
        tabs: _buildCategoryTab(),
      )
    );
  }
}
