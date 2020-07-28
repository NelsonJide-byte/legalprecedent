import 'package:flutter/material.dart';
import './pages/SplashScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
