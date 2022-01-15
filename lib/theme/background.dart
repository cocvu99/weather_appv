// import 'dart:ffi';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:weather_appv/theme/background.dart';

// class Background extends StatefulWidget {
//   Background({Key? key}) : super(key: key);

//   @override
//   _BackgroundState createState() => _BackgroundState();
// }

// class _BackgroundState extends State<Background> {
//   String cityName = 'tr'; 
//   var nhietDo;
//   var currently;

//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
      
//       home: Scaffold(

//         body: Stack(
//           children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color.fromARGB(255, 160, 23, 184), Color.fromARGB(255, 230, 188, 99)
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight
//                   )
//                 ),
//               ),

//               Container(
//                 height: MediaQuery.of(context).size.height / 3,
//                 width: MediaQuery.of(context).size.width,

//                 // Xac dinh vi tri container
//                 // color: Colors.red,
//                 child: Scaffold(
//                   backgroundColor: Colors.transparent,
//                   body: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Padding(
//                           padding: EdgeInsets.only(bottom: 10.0),
//                           child: Text(
//                             "Thoi tiet " + cityName + " hien tai",
//                             style: TextStyle(color: Colors.white, fontSize: 30.0),
//                             ),
//                           ),

//                           Text(
//                             nhietDo != null ? nhietDo.toString() + "\u00B0" + "C" : "Loading",
//                             style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.w600),
//                           ),

//                           Padding(padding: EdgeInsets.only(top: 10.0),
//                             child: Text(
//                             currently != null ? "Trang thai thoi tiet: " + currently.toString() : "Loading",
//                             style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600),
//                             ),
//                           ),

//                         Column(
//                           children: <Widget>[
//                               Container(
//                                 width: MediaQuery.of(context).size.width / 1.4,
//                                 alignment: Alignment.center,

//                                 // dinh vi vi tri container
//                                 // color: Colors.blue,
//                                 child: TextField(
//                                   style: TextStyle(color: Colors.white, fontSize: 25.0),
//                                   decoration: InputDecoration(
//                                     hintText: "Nhap ten thanh pho",
//                                     hintStyle: TextStyle(
//                                       color: Colors.white, fontSize: 18.0
//                                     ),
//                                     prefixIcon: Icon(Icons.search, color: Colors.white,)
//                                   ),
//                                 ),
//                               )
//                           ],
//                         )
//                       ],
//                     ),

                    
//                   )
                  
//                 ),
//               ),

              

//               // Expanded(
//               //   child: child
//               //   )


//             ],
//           ),

//         // child: Scaffold(
//         //   body: const Center(
//         //     child: Text("data"),
//         //   ),
//         // ),
//       )
//     ); 
//   }
// }