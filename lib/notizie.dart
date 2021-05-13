import 'package:flutter/material.dart';
import 'rss.dart';
import 'package:webfeed/webfeed.dart';

class Notizie extends StatelessWidget {
  final Rss motoreRSS = Rss();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TuttoFare'),
      ),
      body: FutureBuilder(
          future: motoreRSS.leggiArticoli(),
          builder:
              (BuildContext context, AsyncSnapshot<List<RssItem>> snapshot) {
            if (snapshot.hasData) {
              List<RssItem> lista = snapshot.data;
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(lista[index].title),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
