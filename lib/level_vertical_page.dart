// import 'package:flutter/material.dart';
// import 'package:game_levels_scrolling_map/game_levels_scrolling_map.dart';
// import 'package:game_levels_scrolling_map/model/point_model.dart';

// class MapVerticalExample extends StatefulWidget {
//   const MapVerticalExample({Key? key}) : super(key: key);

//   @override
//   State<MapVerticalExample> createState() => _MapVerticalExampleState();
// }

// class _MapVerticalExampleState extends State<MapVerticalExample> {


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           child: GameLevelsScrollingMap.scrollable(
//             imageUrl:"assets/map_vertical.png",
//             direction: Axis.vertical,
//             reverseScrolling: true,
//             pointsPositionDeltaX: 25,
//             pointsPositionDeltaY: 30,
//             svgUrl: 'assets/map_vertical.svg',
//             points: points,
//           ),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }

//   @override
//   void initState() {
//     fillTestData();
//   }

//   List<PointModel> points = [];

//   void fillTestData() {
//     for(int i = 0; i<1000 ; i++){
//       PointModel point = PointModel(
//           100,
//           Container(width: 40, height: 40, child: testWidget(i)),
//       );

//       if(i == 50) point.isCurrent = true;

//       points.add(point);
//     }
//   }


//   Widget testWidget(int order) {
//     return InkWell(
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Image.asset(
//             "assets/map_vertical_point.png",
//             fit: BoxFit.fitWidth,
//             width: 50,
//           ),
//           Text("$order",
//               style: const TextStyle(color: Colors.black,
//                   fontSize: 15))
//         ],
//       ),
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               content: Text("Point $order"),
//               actions: <Widget>[
//                 ElevatedButton(
//                   child: const Text("OK"),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }