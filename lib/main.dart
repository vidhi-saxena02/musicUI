import 'package:flutter/material.dart';
import 'package:music_practice/Screens/HomePage.dart';
import 'package:music_practice/helper/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        return OrientationBuilder(
          builder: (context,orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Music App',
              theme: ThemeData(
                primaryColor: Colors.deepOrangeAccent.shade100
              ),
              home: const HomePage(),
            );
          }
        );
      }
    );
  }
}
