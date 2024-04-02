import 'dart:convert';

import 'package:brainboost/data%20model/placementmodal.dart';
import 'package:http/http.dart' as http;

class PlacementService {
  Future<PlacementModal> getplacementdata() async {
    String url = 'https://main-project-render.onrender.com/placement/';
    Uri uri = Uri.parse(url);

    late final response;
    try {
      response = await http.get(uri);
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      print("completed");
      return PlacementModal.fromjson(jsonDecode(response.body));
    } else {
      throw Exception('unable to get current sem data');
    }
  }
}
