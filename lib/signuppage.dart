import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/loginpage.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool isVisible=false;
  Future<void> createUser() async{
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
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
            Text("Lets create an account for you",style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.inversePrimary)),
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
                onPressed: () async{
                  await createUser();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                child: Text("Sign Up",
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
                Text("Already have an account?",style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.inversePrimary)),
                SizedBox(width: 10),
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){return Loginpage();}));
                    },
                    child: Text("Log In",style: TextStyle
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
