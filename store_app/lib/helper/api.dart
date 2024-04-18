import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? tokens}) async {
    Map<String, String> headers = {};
    if (tokens != null) {
      headers.addAll(
        {'Authorization ': 'Bearer $tokens'},
      );
    }

    http.Response response = await http.post(Uri.parse(url));
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
}
