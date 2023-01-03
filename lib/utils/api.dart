import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class API {
  static post(String dest, Map<String, dynamic> param) async {
    Uri url = Uri.parse(Config.appUrl + dest);
    var encode = jsonEncode(param);
    if (kDebugMode) {
      print('Destination ::: $url');
      print('Post parameter ::: $encode');
    }
    try {
      http.Response response = await http.post(url,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          },
          body: encode);
      var decode = jsonDecode(response.body);
      if (decode['status'] == 'success') if (kDebugMode) print(decode);
      if (decode['status'] == 'fail') throw Exception(decode['data']);
    } on Exception catch (e) {
      if (kDebugMode) print("$e\nCheck your route destination and parameters");
    }
  }

  static getData(String dest) async {
    Uri url = Uri.parse(Config.appUrl + dest);
    if (kDebugMode) {
      print('Destination ::: $url');
    }
    try {
      http.Response response = await http.get(url);
      var decode = jsonDecode(response.body);
      var data = decode['data'][0];
      if (decode['status'] == 'success') if (kDebugMode) print(decode);
      if (decode['status'] == 'fail') throw Exception(decode['data']);
      return data;
    } on Exception catch (e) {
      if (kDebugMode) print(e);
    }
  }
}
