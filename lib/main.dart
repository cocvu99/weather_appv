import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Weather AppV'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Thoi tiet Ha Noi hien tai",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),

                Text(
                  "13" + "\u00B0" + "C",
                  style: TextStyle(
                    color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Trang thai: Mua",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget> [
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    title: Text("Nhiet Do: "),
                    trailing: Text("13" + "\u00B0" + "C"),
                  ),

                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.cloud),
                    title: Text("Trang thai: "),
                    trailing: Text("Mua"),
                  ),

                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text("Do am: "),
                    trailing: Text("12 " + "%"),
                  ),

                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("Toc do gio: "),
                    trailing: Text("5" + "km/h"),
                  ),
                ],
              ),
              )
          )
        ],
      ),
    );
  }
}
