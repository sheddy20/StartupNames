import 'package:flutter/material.dart';
import 'package:startUp/widgets/random.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StartUp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: Colors.deepOrange,
        ),
      ),
      home: RandomWords(),
    );
  }
}
