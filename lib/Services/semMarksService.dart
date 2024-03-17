import 'dart:convert';

import 'package:brainboost/data%20model/SemMarksModel.dart';
import 'package:http/http.dart' as http;

class SemMarksService {
  Future<SemMarksModel> getcurrsemmarks(String email, String sem) async {
    String url = 'http://127.0.0.1:8000/analysis/';
    Uri uri = Uri.parse(url);
    final body = {"email": "kotashashank-cmpn@atharvacoe.ac.in", "sem": "sem7"};
    late final response;
    try {
      response = await http.post(uri, body: jsonEncode(body), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      return SemMarksModel.fromjson(
          jsonDecode(response.body), "kotashashank-cmpn@atharvacoe.ac.in");
    } else {
      throw Exception('unable to get current sem data');
    }
  }
}
