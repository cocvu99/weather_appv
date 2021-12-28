import 'package:flutter/material.dart';
import 'package:weather_appv/controller/search_controller.dart';
import 'package:weather_appv/theme/app_colors.dart';

// final controller = SearchController();

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Text(
            "Hello World",
            style: TextStyle(
              color: Colors.blue, fontSize: 40.0
            ),
          ),
        )
      ],
    );
  }
}
