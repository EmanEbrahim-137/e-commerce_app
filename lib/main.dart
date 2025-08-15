import 'package:flutter/material.dart';
import 'package:my_s_project/splach_screen.dart';
 


 void main() {
   runApp(MyApp());
 }

 class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: SplachScreen(),
    );
  }
}

