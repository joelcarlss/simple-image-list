// import 'package:ImageList/helpers/navigate.dart';
import 'package:ImageList/controllers/auth_controller.dart';
import 'package:ImageList/widgets/custom_button.dart';
import 'package:ImageList/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen(this.setIsSignedIn);

  final Function setIsSignedIn;

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool showSpinner = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  setSpinner(val) {
    setState(() {
      showSpinner = val;
    });
  }

  trySignIn() async {
    setSpinner(true);
    await signInUser(
            usernameController.value.text, passwordController.value.text)
        .then((_) => {
              // navigateToScreen(context, DashBoard()),
              widget.setIsSignedIn(true),
              setSpinner(false)
            })
        .catchError((onError) => print(onError));
  }

  @override
  Widget build(BuildContext context) {
    renderSigninContent() => Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Logga in',
                style: TextStyle(fontSize: 25),
              ),
              CustomTextField(
                  'Enter your username', usernameController, 'text'),
              CustomTextField(
                  'Enter your password', passwordController, 'password'),
              CustomButton(
                'Login',
                trySignIn,
                backgoundColor: Colors.blue,
                textColor: Colors.white,
              )
            ],
          ),
        );
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in screen'),
      ),
      body: Center(
        child:
            showSpinner ? CircularProgressIndicator() : renderSigninContent(),
      ),
    );
  }
}
