import 'package:flutter/material.dart';
import 'screens/splashscreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white
      ),
      home: splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
