import 'package:flutter/material.dart';
import 'package:galaxy_sub/Models/galaxy_model.dart';

class Details extends StatefulWidget {
  Details({super.key, required this.gm});

  GalaxyModel gm;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.gm.name),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              child: Image.asset("assets/images/detail_background.jpg",
                  fit: BoxFit.fitHeight),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: MediaQuery.sizeOf(context).height / 2,
                  width: MediaQuery.sizeOf(context).width,
                  child: Image.network(widget.gm.image),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black12,
                              Colors.cyan.shade200,
                            ],
                          ),
                        ),
                        child: Text(
                          widget.gm.description,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
