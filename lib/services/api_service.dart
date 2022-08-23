import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie_res_model.dart';

class APIService {
  Future<MovieResModel?> getLastMovie() async {
    var url = Uri.parse('https://api.themoviedb.org/3/trending/movie/day?api_key=c2b7511f6405e2f7055eed106ab1a087');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final map = jsonDecode(response.body);
      return MovieResModel.fromJson(map);
    } else {
      return null;
    }
  }
}
