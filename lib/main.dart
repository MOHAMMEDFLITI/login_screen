import 'package:flutter/material.dart';
import 'package:login_screen/screen/login_screen.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginScreen(),
    );
  }
}

