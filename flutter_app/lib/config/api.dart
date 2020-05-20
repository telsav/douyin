import 'package:http/http.dart' as http;

class RequestController {
  static String host = "https://www.tiktok.com/";
  String url = host +
      "/share/item/list?secUid=&id=&type=5&count=30&minCursor=0&maxCursor=0&shareUid=&lang=en&_signature=pKb.ogAgEB9ImoSQahoqJKSm.rAAPox";

  Future<String> getCookie() async {
    try {
      var response = await http.get(host + "/share/item/");
      return response.headers["set-cookie"];
    } catch (e) {
      return "error";
    }
  }

  var headers = {
    "type": "5",
    "count": "30",
    "minCursor": "0",
    "maxCursor": "0",
    "lang": "en",
    "_signature": "pKb.ogAgEB9ImoSQahoqJKSm.rAAPox HTTP/1.1",
    "Accept": "application/json: text/plain: */*",
    "Sec-Fetch-Dest": "empty",
    "User-Agent":
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64 AppleWebKit/537.36 (KHTML: like Gecko Chrome/80.0.3987.149 Safari/537.36",
    "Origin": "https://www.tiktok.com",
    "Sec-Fetch-Site": "same-site",
    "Sec-Fetch-Mode": "cors",
    "Referer": "https://www.tiktok.com/trending/?lang",
    "Accept-Language": "en-GB:en-US;q",
  };

  void setCookie(String cookie) {
    headers["set-cookie"] = cookie;
  }
}
