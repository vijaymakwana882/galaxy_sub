import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(RockysAnimation());
}

class RockysAnimation extends StatefulWidget {
  const RockysAnimation({super.key});

  @override
  State<RockysAnimation> createState() => _RockysAnimationState();
}

class _RockysAnimationState extends State<RockysAnimation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
          backgroundColor: Colors.black,
        ),
      ),
      home: HomePage(),
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  double value = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double val = value * 100;
    String valu = (val.toStringAsFixed(2));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}

//
// void incrementvalue() {
//   Timer.periodic(Duration(seconds: 1), (timer) {
//     setState(() {
//       if (value == 1.0) {
//         timer.cancel();
//       } else {
//         if(value >= 0.9){
//           value=1;
//         }
//         else{
//           value += 0.1;
//         }
//       }
//     });
//   });
// }

//
// void incrementvalue() {
//   Timer.periodic(Duration(seconds: 1), (timer) {
//     setState(() {
//       if (value == 1.0) {
//         timer.cancel();
//       } else {
//         if(value >= 0.9){
//           value=1;
//         }
//         else{
//           value += 0.1;
//         }
//       }
//     });
//   });
// }/

// Center(
//   child: CircularProgressIndicator(
//     value: value,
//     color: Colors.black,
//     backgroundColor: Colors.red,
//     valueColor: AlwaysStoppedAnimation(Colors.yellow),
//   ),
// ),
// Text("${valu} %"),
// ElevatedButton(
//     onPressed: () {
//       incrementvalue();
//       setState(() {});
//     },
//     child: Text("fruiufb"))
