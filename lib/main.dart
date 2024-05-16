import 'package:chipper_clone/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import './screens/onboarding.dart';
import './screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chipper Cash',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        canvasColor: Colors.white
        // fontFamily: 'DM Sans',
      ),
      home: Dashboard(),
    );
  }
}
