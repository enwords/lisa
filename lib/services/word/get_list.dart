import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lisa/services/network/get.dart';

class WordGetList {
  final String _backendHost = DotEnv().env['BACKEND_HOST'];

  Future<dynamic> call(String status, int page) async {
    var wordData = await NetworkGet.call(
        '$_backendHost/api/mobile/words?status=$status&page=$page');
    return wordData;
  }
}
