import 'package:flutter/material.dart';
import 'package:weather_appv/theme/background.dart';

void main() {
 runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Background()
      
    );
  }
}