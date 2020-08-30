import 'package:http/http.dart';

class NetworkGet {
  static Future<dynamic> call(String url) async {
    print('GET $url');
    var response = await get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}
