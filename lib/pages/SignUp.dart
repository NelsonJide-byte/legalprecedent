import 'package:flutter/material.dart';
import 'dashbaord.dart';
import "package:legal_precedents/services/auth_service.dart";

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

// TODO => Add AuthService => DONE
// TODO => Add the TextControllers => DONE
// TODO => Initialize controllers => DONE
// TODO => Add submit function
// TODO => Attach controllers
// TODO => Finish
class _SignUpState extends State<SignUp> {
  bool _showPassword = true;
  AuthService git  = AuthService();

  TextEditingController emailInputController;
  TextEditingController passwordController;
  TextEditingController nameController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    passwordController = new TextEditingController();
    nameController = new TextEditingController();
    super.initState();
  }

  submit(String email, String password, String name) {
    try {
      _authService.createUser(email, password, name);
      emailInputController.clear();
      passwordController.clear();
      nameController.clear();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Dashbaord()), (_) => false);

    }
    print('Sign Up Completed');
  }

  @override
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
              Center(
                child: Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Color(0xFF707070),
                    ),
                    hintText: "First Name",
                    contentPadding: EdgeInsets.only(left: 20, top: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Color(0xFF707070),
                    ),
                    hintText: "Last Name",
                    contentPadding: EdgeInsets.only(left: 20, top: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(fontSize: 18),
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
                width: 60,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
