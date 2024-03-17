import 'dart:convert';

import 'package:brainboost/data%20model/SemMarksModel.dart';
import 'package:http/http.dart' as http;

class SemMarksService {
  Future<SemMarksModel> getcurrsemmarks(String email, String sem) async {
    String url = 'https://main-project-render.onrender.com/analysis/';
    Uri uri = Uri.parse(url);
    final body = {"email": email, "sem": sem};
    late final response;
    try {
      response = await http.post(uri, body: jsonEncode(body), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      print("completed");
      return SemMarksModel.fromjson(jsonDecode(response.body), email);
    } else {
      throw Exception('unable to get current sem data');
    }
  }
}
