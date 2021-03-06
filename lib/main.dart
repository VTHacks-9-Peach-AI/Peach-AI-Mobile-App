import 'package:flutter/material.dart';
import 'package:peachai/constants.dart';
import 'package:peachai/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peach AI',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      theme: ThemeData(primaryColor: primary, fontFamily: 'ValeraRound'),
    );
  }
}
