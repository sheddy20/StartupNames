import 'package:flutter/material.dart';
import 'package:startUp/Login/authProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool signUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.deepOrange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(18.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                height: 50.0,
                width: 320.0,
              ),
            ),
            SizedBox(height: 18.0),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(18.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                height: 50.0,
                width: 320.0,
              ),
            ),
            SizedBox(height: 18.0),
            RaisedButton(
              onPressed: () {
                if (signUp) {
                  context.read<AuthenticationProvider>().signUp(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                } else {
                  context.read<AuthenticationProvider>().signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                }
              },
              color: Colors.white,
              textColor: Colors.black,
              child: signUp
                  ? Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            SizedBox(height: 18.0),
            OutlineButton(
              onPressed: () {
                setState(() {
                  signUp = !signUp;
                });
              },
              color: Colors.white,
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: signUp
                  ? Text(
                      "Have an account? Sign In",
                      style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "Create an account",
                      style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
