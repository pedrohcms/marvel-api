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
      character = Character(
        id: 1009368,
        name: 'Iron Man Teste',
        description:
            "Wounded, captured and forced to build a weapon by his enemies, billionaire industrialist Tony Stark instead created an advanced suit of armor to save his life and escape captivity. Now with a new outlook on life, Tony uses his money and intelligence to make the world a safer, better place as Iron Man.",
        thumbnailPath:
            'http://i.annihil.us/u/prod/marvel/i/mg/9/c0/527bb7b37ff55/standard_xlarge.jpg',
        comics: 2554,
        series: 623,
        stories: 3875,
        events: 31,
      );
    }

    return character;
  }
}
