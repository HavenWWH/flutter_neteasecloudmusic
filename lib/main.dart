import 'package:flutter/material.dart';
import 'modules/main/bottom_navigation_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter HavenOneApp',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: BottomNavigationWidget(),
    );
  }
}
