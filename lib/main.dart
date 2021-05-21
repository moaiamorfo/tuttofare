import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'notizie.dart';
import 'gps.dart';
import 'pic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBar myappbar = AppBar(
      title: Text('TuttoFare'),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TuttoFare',
      home: Scaffold(
        appBar: myappbar,
        body: Home(myappbar.preferredSize.height),
      ),
    );
  }
}

class Home extends StatelessWidget {
  double altezzaAppbar;
  Home(this.altezzaAppbar);
  @override
  Widget build(BuildContext context) {
    double larghezzaDisplay = MediaQuery.of(context).size.width;
    double altezzaDisplay = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notizie()),
                  );
                },
                child: Container(
                  width: larghezzaDisplay / 2,
                  height: altezzaDisplay / 2 - altezzaAppbar / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("asset/img/notizie.jpg"),
                  )),
                  child: Stack(
                    children: [
                      Positioned(
                        width: larghezzaDisplay / 2,
                        left: 10.0,
                        bottom: 10.0,
                        child: AutoSizeText(
                          "Notizie",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => GPS()));
                },
                child: Container(
                  width: larghezzaDisplay / 2,
                  height: altezzaDisplay / 2 - altezzaAppbar / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("asset/img/gps.png"),
                  )),
                  child: Stack(
                    children: [
                      Positioned(
                        width: larghezzaDisplay / 2,
                        left: 10.0,
                        bottom: 10.0,
                        child: AutoSizeText(
                          "GPS",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Pic()));
                },
                child: Container(
                  child: Stack(
                    children: [
                      Positioned(
                        width: larghezzaDisplay / 2,
                        left: 10.0,
                        bottom: 10.0,
                        child: AutoSizeText(
                          "Pic",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  width: larghezzaDisplay / 2,
                  height: altezzaDisplay / 2 - altezzaAppbar / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("asset/img/foto.jpg"),
                  )),
                ),
              ),
              Container(
                width: larghezzaDisplay / 2,
                height: altezzaDisplay / 2 - altezzaAppbar / 2,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
