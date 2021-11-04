import 'package:flutter/material.dart';
import 'package:healthy_app/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: "Poppins",
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          height: 35,
          padding: const EdgeInsets.all(10.0),
          // preferBelow: false,
          textStyle: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}