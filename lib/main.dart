import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/firebase_options.dart';
import 'homepage.dart';
import 'package:food_delivery_app/restaurant.dart';
import 'package:food_delivery_app/signuppage.dart';
import 'package:food_delivery_app/themeprovider.dart';
import 'package:food_delivery_app/utils.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await sharedPrefs.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => Restaurant())
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme=Provider.of<ThemeProvider>(context).getTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:theme,
      home: StreamBuilder(
          stream: FirebaseAuth.instance.idTokenChanges(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator.adaptive());
            }
            if(snapshot.hasData){
              return Homepage();
            }
            return Signuppage();
          }
      )
    );
  }
}
