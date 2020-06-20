import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lisa/services/network/get_data.dart';

class WordsGetList {
  final String _backendHost = DotEnv().env['BACKEND_HOST'];

  Future<dynamic> call(String status, int page) async {
    var wordData = await NetworkGetData.call(
        '$_backendHost/api/mobile/words?status=$status&page=$page');
    return wordData;
  }
}
