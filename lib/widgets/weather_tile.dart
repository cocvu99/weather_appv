import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  IconData icon;
  String title;
  String subtitle;

  WeatherTile({
    required this.icon,
    required this.title,
    required this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.thermostat_outlined, color: Colors.lightBlue,)
        ],
      ),

      title: Text(
        "Nhiet Do",
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.blue),
      ),

      subtitle: Text(
        "Chu thich",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 94, 151, 197)
        ),
      ),
    );
  }
}