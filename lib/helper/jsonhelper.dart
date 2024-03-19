// import 'dart:convert';
//
// import 'package:flutter/services.dart';
//
// import '../Models/galaxy_model.dart';
//
// Future<List<GalaxyModel>> GalaxyData() async {
//   List<GalaxyModel> finaldata = [];
//
//   String Jsonbundle =
//       await rootBundle.loadString("assets/jsonbank/galaxy.json");
//   Map Jd = jsonDecode(Jsonbundle);
//   List<dynamic> AllGalaxy = Jd["galaxy"];
//   finaldata = AllGalaxy.map((e) => GalaxyModel(
//         position: e['position'],
//         name: e["name"],
//         image: e['image'],
//         velocity: e["velocity"],
//         distance: e["distance"],
//         description: e["description"],
//       )).toList();
//   return finaldata;
// }
