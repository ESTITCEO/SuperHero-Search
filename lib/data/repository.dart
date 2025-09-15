import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:superhero_app/data/model/superhero_response.dart';

class Repository {
  Future<SuperheroResponse?> fetchSuperheroInfo(String name) async {
    final response = await http.get(
      Uri.parse(
        "https://superheroapi.com/api/7332006dd2e64b613db4b8468d5f4943/search/$name",
      ),
    );

    if (response.statusCode == 200) {
      var decoredJson = jsonDecode(response.body);
      SuperheroResponse superheroResponse = SuperheroResponse.fromJson(
        decoredJson,
      );
      return superheroResponse;
    } else {
      return null;
    }
  }
}
