import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo_model.dart';

class PhotoService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<PhotoModel>> fetchPhotos() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => PhotoModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
