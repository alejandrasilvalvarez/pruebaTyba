import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'package:soloquieroquefuncione/models/Character.dart';

Future<List<Character>> getCharacters() async {
  var url = Uri.https('rickandmortyapi.com', '/api/character');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

    var results = jsonResponse['results'] as List<dynamic>;
    return results.map((e) => Character.fromJson(e)).toList();
  } else {
    return [Character()];
  }
}
