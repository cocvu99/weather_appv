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
  
  var nhietDo;
  var motaThoiTiet;
  var currently;
  var doAm;
  var tocdoGio;


  // key: 5022a23fca290814f90a6a12034006ca
  Future getWeather() async {
    http.Response response = await http.get(
      Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=Boston&units=metric&appid=5022a23fca290814f90a6a12034006ca"));
    var results = jsonDecode(response.body);
    setState(() {
      this.nhietDo = results['main']['temp'];
      this.motaThoiTiet = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.doAm = results['main']['humidity'];
      this.tocdoGio = results['wind']['speed'];
    });
  }

  @override 
  void initState(){
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 27, 27, 27),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Boston hiện tại",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),

                Text(
                  nhietDo != null ? nhietDo.toString() + "\u00B0" : "Loading",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600
                  )
                ),

                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : "Loading",
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
                children:  <Widget> [
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    title: Text("Nhiệt Độ"),
                    trailing: Text(nhietDo != null ? nhietDo.toString() + "\u00B0" : "Loading"),
                  ),

                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.cloud),
                    title: Text("Thời tiết"),
                    trailing: Text(motaThoiTiet != null ? motaThoiTiet.toString() : "Loading"),
                  ),

                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text("Độ ẩm"),
                    trailing: Text(doAm != null ? doAm.toString() : "Loading"),
                  ),

                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("Tốc độ gió"),
                    trailing: Text(tocdoGio != null ? tocdoGio.toString() : "Loading"),
                  )

                ],
              ),
            )
            )
        ],
      ),
    );
  }
}
