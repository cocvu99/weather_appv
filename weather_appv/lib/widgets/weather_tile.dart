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
          Icon(icon, color: Colors.lightBlue,)
        ],
      ),

      title: Text(
        title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
      ),

      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 91, 204, 238)
          ),
      ),
    );
  }
}