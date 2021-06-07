import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imageLib;
import 'package:path/path.dart';
import 'package:share/share.dart';
import 'package:googleapis/drive/v2.dart';

import 'dart:io';
import 'dart:async';

class Pic extends StatefulWidget {
  @override
  _PicState createState() => _PicState();
}

class _PicState extends State<Pic> {
  File _image;
  final picker = ImagePicker();
  String filename;

  // codice per applicazione filtri

  Future applicaFiltri(context) async {
    filename = basename(_image.path);
    var image = imageLib.decodeImage(_image.readAsBytesSync());
    image = imageLib.copyResize(image, width: 600);
    Map imagefile = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new PhotoFilterSelector(
          title: Text("Photo Filter Example"),
          image: image,
          filters: presetFiltersList,
          filename: filename,
          loader: Center(child: CircularProgressIndicator()),
          fit: BoxFit.contain,
        ),
      ),
    );
    if (imagefile != null && imagefile.containsKey('image_filtered')) {
      setState(() {
        _image = imagefile['image_filtered'];
      });
    }
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget mostraSelfie() {
    if (_image == null)
      return Placeholder();
    else
      return Image.file(_image);
  }

  @override
  Widget build(BuildContext context) {
    AppBar myappbar = AppBar(
      title: Text('Pic'),
      actions: [
        IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.shareFiles([_image.path], text: "Ecco il mio selfie!");
            })
      ],
    );
    double altezzaSchermo = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: myappbar,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            height: altezzaSchermo / 2 - myappbar.preferredSize.height / 2,
            child: mostraSelfie(),
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
                        onPressed: () {
                          getImage();
                        },
                        child: Icon(
                          Icons.photo_camera,
                          size: 50.0,
                        ))),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            applicaFiltri(context);
                          },
                          child: Text("Scegli filtro")),
                      Icon(Icons.ac_unit)
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
