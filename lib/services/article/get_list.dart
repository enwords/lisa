import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lisa/services/network/get.dart';

class ArticleGetList {
  final String _backendHost = DotEnv().env['BACKEND_HOST'];

  Future<dynamic> call(int page) async {
    var articleData = await NetworkGet.call(
        '$_backendHost/api/mobile/articles?page=$page');
    return articleData;
  }
}
