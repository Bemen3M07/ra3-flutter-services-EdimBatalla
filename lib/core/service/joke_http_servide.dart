import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_hello_world/core/entity/joke_model.dart';

class JokeHttpService {
  final String _baseUrl = 'https://api.sampleapis.com';

  Future<List<JokeModel>> getGoodJokes() async {
    final uri = Uri.parse('$_baseUrl/jokes/goodJokes');
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Error getGoodJokes: ${response.statusCode}');
    }

    final List<dynamic> decoded = jsonDecode(response.body);
    return decoded
        .map((e) => JokeModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }
}
