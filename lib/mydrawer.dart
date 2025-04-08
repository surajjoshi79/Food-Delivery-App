import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/settingpage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset("assets/food_delivery_main.gif"),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home,color: Theme.of(context).colorScheme.inversePrimary),
            title: Text("H O M E",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Theme.of(context).colorScheme.inversePrimary),
            title: Text("S E T T I N G S",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context){return Settingpage();}));
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              leading: Icon(Icons.logout_sharp,color: Theme.of(context).colorScheme.inversePrimary),
              title: Text("L O G O U T",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
              onTap: (){
                Navigator.of(context).pop();
                FirebaseAuth.instance.signOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
