import 'package:flutter/material.dart';
import 'package:legal_precedents/pages/ForgotPassword.dart';
import 'package:legal_precedents/pages/SignUp.dart';
import 'package:legal_precedents/pages/dashbaord.dart';
import 'package:legal_precedents/services/auth_service.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _showPassword = true;

  AuthService _authService = AuthService();

  TextEditingController emailInputController;
  TextEditingController passwordController;

  @override
  initState() {
    emailInputController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  submit(String email, String password) async {
    var uid = await _authService.signIn(
      email,
      password,
    );
    if (uid != null) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Dashbaord()), (_) => false);
      emailInputController.clear();
      passwordController.clear();
    } else {
      print("An error occurred");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Text(
                'Sign into Your Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: emailInputController,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Color(0xFF707070),
                    ),
                    hintText: "Email Address",
                    contentPadding: EdgeInsets.only(left: 20, top: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                style: TextStyle(fontSize: 22),
                obscureText: this._showPassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      icon: Icon(this._showPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          this._showPassword = !this._showPassword;
                        });
                      }),
                  hintText: "Password",
                  contentPadding: EdgeInsets.only(left: 20, top: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    submit(emailInputController.text.trim(),
                        passwordController.text);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account yet ? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  GestureDetector(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
