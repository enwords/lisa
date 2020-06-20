import 'package:http/http.dart';

class NetworkGetData {
  static Future<dynamic> call(String url) async {
    print('Calling uri: $url');
    var response = await get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}
