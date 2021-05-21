import 'package:flutter/material.dart';
import 'rss.dart';
import 'package:webfeed/webfeed.dart';
import 'package:url_launcher/url_launcher.dart';

class Notizie extends StatelessWidget {
  final Rss motoreRSS = Rss();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notizie'),
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
                      trailing: Icon(Icons.keyboard_arrow_right),
                      leading: CircleAvatar(
                        backgroundImage: lista[index].enclosure == null
                            ? AssetImage("asset/img/notizie.jpg")
                            : Image.network(lista[index].enclosure.url).image,
                      ),
                      subtitle: Text(lista[index].pubDate.day.toString() +
                          "/" +
                          lista[index].pubDate.month.toString() +
                          "/" +
                          lista[index].pubDate.year.toString()),
                      onTap: () async {
                        if (await canLaunch(lista[index].link)) {
                          await launch(lista[index].link);
                        }
                      });
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
