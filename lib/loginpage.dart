import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/signuppage.dart';
import 'homepage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool isVisible=false;
  Future<void> loginUser() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return Homepage();}));
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User don't exist")));
    }
  }
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset("assets/food_delivery_main.gif"),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Food Delivery App",style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.inversePrimary)),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color:Theme.of(context).colorScheme.primary,width: 1.5)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color:Theme.of(context).colorScheme.tertiary,width: 1.5)
                )
              ),
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color:Theme.of(context).colorScheme.primary,width: 1.5)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color:Theme.of(context).colorScheme.tertiary,width: 1.5)
                  ),
                suffixIcon: IconButton(onPressed: (){setState(() {
                  isVisible=!isVisible;
                });}, icon: Icon(isVisible?Icons.visibility_off:Icons.visibility))
              ),
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
              obscureText: !isVisible,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (){
                  loginUser();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                child: Text("Log In",
                    style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.bold,color:Theme.of(context).colorScheme.inversePrimary)
                )
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.inversePrimary)),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){return Signuppage();}));
                  },
                    child: Text("Register now",style: TextStyle
                      (fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}