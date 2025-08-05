import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_api/models/post_model.dart';

class PostService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<PostModel>> ListPost() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw Exception('Gagal Load Data!!');
    }
  }
}