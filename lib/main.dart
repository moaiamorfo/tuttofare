import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'notizie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBar myappbar = AppBar(
      title: Text('TuttoFare'),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
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
        Row(
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
            Container(
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
          ],
        ),
        Row(
          children: [
            Container(
              width: larghezzaDisplay / 2,
              height: altezzaDisplay / 2 - altezzaAppbar / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("asset/img/notizie.jpg"),
              )),
            ),
            Container(
              width: larghezzaDisplay / 2,
              height: altezzaDisplay / 2 - altezzaAppbar / 2,
              color: Colors.red,
            ),
          ],
        ),
      ],
    );
  }
}
