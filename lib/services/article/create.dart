import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lisa/services/network/post.dart';

class ArticleCreate {
  final String _backendHost = DotEnv().env['BACKEND_HOST'];

  Future<dynamic> call(String title, String content) async {
    var articleData = await NetworkPost.call(
        '$_backendHost/api/mobile/articles',
        <String, String>{'title': title, 'content': content});
    return articleData;
  }
}
