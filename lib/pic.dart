import 'package:flutter/material.dart';

class Pic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBar myappbar = AppBar(
      title: Text('Pic'),
    );
    double altezzaSchermo = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: myappbar,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            height: altezzaSchermo / 2 - myappbar.preferredSize.height / 2,
            child: Placeholder(),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: altezzaSchermo / 2 - myappbar.preferredSize.height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(25.0),
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.photo_camera,
                          size: 50.0,
                        ))),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("Filtro 1")),
                      ElevatedButton(onPressed: () {}, child: Text("Filtro 2")),
                      ElevatedButton(onPressed: () {}, child: Text("Filtro 3")),
                      ElevatedButton(onPressed: () {}, child: Text("Filtro 4"))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
