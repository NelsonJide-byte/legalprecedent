import "package:flutter/material.dart";
import 'package:legal_precedents/pages/Login.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 10);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            "LP",
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 80,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
