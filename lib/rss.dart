import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';

class Rss {
  final String percorsoRSS =
      "https://www.repubblica.it/rss/homepage/rss2.0.xml?ref=RHFT";

  Future<List<RssItem>> leggiArticoli() async {
    var client = Client();
    var response = await client.get(Uri.parse(percorsoRSS));
    var risultato = RssFeed.parse(response.body);
    return risultato.items;
  }
}
