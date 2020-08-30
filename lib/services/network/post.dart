import 'dart:convert';

import 'package:http/http.dart';

class NetworkPost {
  static Future<dynamic> call(String url, Map<String, dynamic> body) async {
    print('POST $url $body');
    var response = await post(url, body: jsonEncode(body), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}

//class NetworkPost {
//  static Future<dynamic> call(String url, Map<String, dynamic> body) async {
//    print('POST $url $body');
//    var response = await post(url, body: body, headers: <String, String>{
//      'Content-Type': 'application/json; charset=UTF-8',
//      'Accept': 'application/json; charset=UTF-8',
//    });
//    if (response.statusCode == 200 || response.statusCode == 201) {
//      return response.body;
//    } else {
//      print(response.statusCode);
//    }
//  }
//}
