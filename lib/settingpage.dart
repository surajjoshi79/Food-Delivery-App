import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/themeprovider.dart';
import 'package:food_delivery_app/utils.dart';
import 'package:provider/provider.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12)
            ),
            margin: EdgeInsets.only(top:10,left: 25,right: 25),
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark Mode",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.inversePrimary)),
                CupertinoSwitch(
                    value: sharedPrefs.prefs.getBool('isDark')??false,
                    onChanged: (value){Provider.of<ThemeProvider>(context,listen: false).setTheme();}
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
