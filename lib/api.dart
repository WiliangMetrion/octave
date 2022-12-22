import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class API {
  static post(String dest, Map<String, dynamic> param) async {
    Uri url = Uri.parse(Config.CALL_URL + dest);
    if (kDebugMode) {
      print('Destination ::: $url');
      print('Post parameter ::: $param');
    }
    try {
      http.Response response = await http.post(url, body: param);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return '';
      }
    } catch (e) {
      Error();
    }
  }
}
