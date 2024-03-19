import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_sub/Views/screens/details_page.dart';
import '../../Models/galaxy_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  List<GalaxyModel> finaldata = [];

  get ts => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GalaxyData().then((value) {
      setState(() {});
    });
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      duration: Duration(seconds: 5),
    );
  }

  @override
  Future<void> GalaxyData() async {
    String Jsonbundle =
        await rootBundle.loadString("assets/jsonbank/galaxy.json");
    Map Jd = jsonDecode(Jsonbundle);
    List<dynamic> AllGalaxy = Jd["galaxy"];
    finaldata = AllGalaxy.map(
      (e) => GalaxyModel(
        position: e['position'],
        name: e["name"],
        image: e['image'],
        velocity: e["velocity"],
        distance: e["distance"],
        description: e["description"],
      ),
    ).toList();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   child: Image.asset("assets/images/detail_background.jpg",
            //       fit: BoxFit.fitHeight),
            // ),
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: double.infinity,
              decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   colors: [
                  //     Color(0xff040C28),
                  //     Color(0xff152C62),
                  //   ],
                  // ),
                  image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage("assets/images/onee.jpeg"),
              )),
            ),
            PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: finaldata.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.red,
                ),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            finaldata[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 29,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Details(gm: finaldata[index]);
                                },
                              ),
                            );
                          },

                          //Image.network("${finaldata[index].image}"),
                          child: AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _animationController.value * 22 * pi,
                                child: Image.network(
                                  finaldata[index].image,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _animationController.repeat(
                              min: 00.1,
                              max: 0.5,
                            );
                          },
                          child: Icon(Icons.add)),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Color(0xff0B194B),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.place,
                                size: 38,
                                color: Colors.white,
                              ),
                              title: Text(
                                "the ${finaldata[index].name} Planet Position",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "${finaldata[index].position}",
                                style: ts,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Color(0xff0B194B),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.space_bar_outlined,
                                size: 38,
                                color: Colors.white,
                              ),
                              title: Text(
                                "Distance",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "Distance From the Sun ${finaldata[index].distance} million kilometers",
                                style: ts,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Color(0xff0B194B),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.speed_outlined,
                                size: 38,
                                color: Colors.white,
                              ),
                              title: Text(
                                "Velocity",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "${finaldata[index].velocity} ",
                                style: ts,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               alignment: Alignment.center,
//                               height: 50,
//                               width: double.infinity,
//                               child: Text(
//                                 textAlign: TextAlign.start,
//                                 "Planet : ${finaldata[index].name}",
//                                 style: ts,
//                               ),
//                               decoration: BoxDecoration(
//                                   color: Colors.red,
//                                   borderRadius: BorderRadius.circular(15)),
//                             ),
//                           ),

// Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               "Position   :  ${finaldata[index].position}",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 25,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               "Distance  :  ${finaldata[index].distance}",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 25,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               "Velocity   :  ${finaldata[index].velocity}",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 25,
//                               ),
//                             ),
//                           ),

//    body: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             child: Image.asset("assets/images/detail_background.jpg",
//                 fit: BoxFit.fitHeight),
//           ),
//           ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: finaldata.length,
//             itemBuilder: (context, index) => Container(
//               margin: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 // color: Colors.red,
//               ),
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) {
//                             return Details(gm: finaldata[index]);
//                           },
//                         ));
//                       },
//                       child: Image.network("${finaldata[index].image}"),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       height: 150,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                             colors: [Colors.grey, Colors.black12]),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               "Planet      :  ${finaldata[index].name}",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 25,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               "Position   :  ${finaldata[index].position}",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 25,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               "Distance  :  ${finaldata[index].distance}",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 25,
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               "Velocity   :  ${finaldata[index].velocity}",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 25,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
