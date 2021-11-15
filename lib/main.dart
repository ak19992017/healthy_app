// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:healthy_app/dashboard.dart';
import 'package:healthy_app/models/side_bar_model.dart';
import 'package:healthy_app/models/to_do_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => SideBarModel()),
            ChangeNotifierProvider(create: (context) => ToDoModel()),
          ],
          child: DashBoard(),
        ),
      ),
    );
  }
}
