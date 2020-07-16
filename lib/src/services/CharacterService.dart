import 'dart:convert';

import 'package:marvel_api/src/models/Character.dart';
import 'package:marvel_api/src/services/ApiService.dart';
import 'package:dio/dio.dart';

class CharacterService extends ApiService {
  final String resource = 'characters';

  Future<Character> show(String characterName) async {
    String url = this.baseUrl + '/$resource';

    Map<String, dynamic> query = this.makeQueryParams();

    query['name'] = characterName;

    Character character;

    try {
      Response response = await Dio().get(url, queryParameters: query);

      character = Character.fromJson(jsonDecode(response.toString()));
    } catch (e) {
      print(e);
    } finally {
      return character;
    }
  }
}
