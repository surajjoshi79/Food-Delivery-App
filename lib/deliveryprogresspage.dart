import 'package:flutter/material.dart';
import 'package:food_delivery_app/firestore.dart';
import 'package:food_delivery_app/myreceipt.dart';
import 'package:food_delivery_app/restaurant.dart';
import 'package:provider/provider.dart';

class Deliveryprogresspage extends StatefulWidget {
  const Deliveryprogresspage({super.key});

  @override
  State<Deliveryprogresspage> createState() => _DeliveryprogresspageState();
}

class _DeliveryprogresspageState extends State<Deliveryprogresspage> {
  FirestoreService db=FirestoreService();
  @override
  void initState() {
    super.initState();
    db.saveOrder(context.read<Restaurant>().displayCartReceipt());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Delivery in progress...."),
        centerTitle: true,
      ),
      bottomNavigationBar: _buildNavBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyReceipt()
          ],
        ),
      ),
    );
  }

  Widget _buildNavBar(BuildContext context){
    return Container(
      padding: EdgeInsets.all(25),
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40)
        )
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle
            ),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.person)),
          ),
          SizedBox(width: 10),
          Column(
            children: [
              Text("Suraj Joshi",style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold
              )),
              Text("Driver",style: TextStyle(
                color: Theme.of(context).colorScheme.primary
              )),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle
                ),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.message)),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle
                ),
                child: IconButton(onPressed: (){}, color: Colors.green,icon: Icon(Icons.call)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
